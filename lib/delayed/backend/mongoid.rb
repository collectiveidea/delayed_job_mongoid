module Delayed
  module Backend
    module Mongoid
      class Job
        include ::Mongoid::Document
        include ::Mongoid::Timestamps
        include Delayed::Backend::Base
        field :priority,    :type=> Integer, :default => 0
        field :attempts,    :type=> Integer, :default => 0
        field :handler,     :type=> String
        field :run_at,      :type=> Time
        field :locked_at,   :type=> Time
        field :locked_by,   :type=> String
        field :failed_at,   :type=> Time
        field :last_error,  :type=> String

        index ([[:locked_by, -1], [:priority, 1], [:run_at, 1]])

        before_save :set_default_run_at

        def self.before_fork
          ::Mongoid.master.connection.close
        end

        def self.after_fork
          ::Mongoid.master.connection.connect
        end

        def self.db_time_now
          Time.now.utc
        end

        # Reserves this job for the worker.
        #
        # Uses Mongo's findAndModify operation to atomically pick and lock one
        # job from from the collection. findAndModify is not yet available
        # directly thru Mongoid so go down to the Mongo Ruby driver instead.
        def self.reserve(worker, max_run_time = Worker.max_run_time)
          right_now = db_time_now

          conditions = {:run_at  => {"$lte" => right_now}, :failed_at => nil}
          (conditions[:priority] ||= {})['$gte'] = Worker.min_priority.to_i if Worker.min_priority
          (conditions[:priority] ||= {})['$lte'] = Worker.max_priority.to_i if Worker.max_priority

          if ::Mongoid.master.connection.server_version < '1.5.3'
            lock_time = "new Date(#{(right_now - max_run_time).to_f * 1000})"
            conditions['$where'] = "this.locked_by == '#{worker.name}' || this.locked_at == null || this.locked_at < #{lock_time}"
          else
            conditions['$or'] = [
              { :locked_by => worker.name },
              { :locked_at => nil },
              { :locked_at => { '$lt' => (right_now - max_run_time) }}
            ]
          end

          begin
            result = self.db.collection(self.collection.name).find_and_modify(
              :query  => conditions,
              :sort   => [['locked_by', -1], ['priority', 1], ['run_at', 1]],
              :update => {"$set" => {:locked_at => right_now, :locked_by => worker.name}}
            )

            # Return result as a Mongoid document.
            # When Mongoid starts supporting findAndModify, this extra step should no longer be necessary.
            self.find(:first, :conditions => {:_id => result["_id"]}) if result
          rescue Mongo::OperationFailure
            nil # no jobs available
          end
        end

        # When a worker is exiting, make sure we don't have any locked jobs.
        def self.clear_locks!(worker_name)
          self.collection.update({:locked_by => worker_name}, {"$set" => {:locked_at => nil, :locked_by => nil}}, :multi => true)
        end

      end
    end
  end
end
