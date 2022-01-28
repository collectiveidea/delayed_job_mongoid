require 'active_support/concern'
require 'delayed_job'
require 'mongoid'

module Delayed
  module Backend
    module Mongoid
      module Mixin
        extend ::ActiveSupport::Concern

        included do
          include ::Delayed::Backend::Base
          include ::Mongoid::Document
          include ::Mongoid::Timestamps

          field :priority,    type: Integer, default: 0
          field :attempts,    type: Integer, default: 0
          field :handler,     type: String
          field :run_at,      type: Time
          field :locked_at,   type: Time
          field :locked_by,   type: String
          field :failed_at,   type: Time
          field :last_error,  type: String
          field :queue,       type: String

          index locked_by: -1, priority: 1, run_at: 1
          index queue: 1, locked_by: -1, priority: 1, run_at: 1
          index failed_at: 1, locked_by: -1, priority: 1, run_at: 1
          index failed_at: 1, queue: 1, locked_by: -1, priority: 1, run_at: 1

          before_save :set_default_run_at

          def reload(*args)
            reset
            super
          end
        end

        module ClassMethods
          include ::Delayed::Backend::Base::ClassMethods

          def db_time_now
            Time.now.utc
          end

          # Reserves one job for the worker.
          # Atomically picks and locks one job from the collection.
          def reserve(worker, max_run_time = Worker.max_run_time)
            right_now = db_time_now
            criteria = reservation_criteria(worker, right_now, max_run_time)
            criteria.find_one_and_update(
              { '$set' => { locked_at: right_now, locked_by: worker.name } },
              return_document: :after
            )
          end

          # When a worker is exiting, make sure we don't have any locked jobs.
          def clear_locks!(worker_name)
            where(locked_by: worker_name).update_all(locked_at: nil, locked_by: nil)
          end

          # In a multi-process setup, this will be called at boot time
          # to close unnecessary database connections on the parent process.
          def before_fork
            ::Mongoid.disconnect_clients
          end

          # In a multi-process setup, this will be called to ensure fresh
          # database connections are immediately made on each newly spawned child process.
          def after_fork
            ::Mongoid::Clients.clients.each do |_name, client|
              client.close
              client.reconnect
            end
          end

          private

          # Mongo criteria matching all the jobs the worker can reserve.
          # Jobs are sorted by priority and run_at.
          def reservation_criteria(worker, right_now, max_run_time)
            criteria = where(
              run_at: { '$lte' => right_now },
              failed_at: nil
            ).any_of(
              { locked_by: worker.name },
              { locked_at: nil },
              locked_at: { '$lt' => (right_now - max_run_time) }
            )

            criteria = criteria.gte(priority: Worker.min_priority.to_i) if Worker.min_priority
            criteria = criteria.lte(priority: Worker.max_priority.to_i) if Worker.max_priority
            criteria = criteria.any_in(queue: Worker.queues) if Worker.queues.any?
            criteria = criteria.desc(:locked_by).asc(:priority).asc(:run_at)

            criteria
          end
        end
      end
    end
  end
end
