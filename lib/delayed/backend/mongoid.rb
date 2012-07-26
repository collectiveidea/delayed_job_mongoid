# encoding: utf-8
require 'delayed_job'
require 'mongoid'

module Delayed
  module Backend
    module Mongoid
      class Job
        include ::Mongoid::Document
        include ::Mongoid::Timestamps
        include Delayed::Backend::Base

        field :priority,    :type => Integer, :default => 0
        field :attempts,    :type => Integer, :default => 0
        field :handler,     :type => String
        field :run_at,      :type => Time
        field :locked_at,   :type => Time
        field :locked_by,   :type => String
        field :failed_at,   :type => Time
        field :last_error,  :type => String
        field :queue,       :type => String

        index :locked_by => -1, :priority => 1, :run_at => 1

        before_save :set_default_run_at

        def self.db_time_now
          Time.now.utc
        end

        # Reserves this job for the worker.
        #
        # Uses Mongo's findAndModify operation to atomically pick and lock one
        # job from from the collection.
        def self.reserve(worker, max_run_time = Worker.max_run_time)
          right_now = db_time_now

          criteria = self.where(
            :run_at => {"$lte" => right_now},
            :failed_at => nil
          ).any_of(
            { :locked_by => worker.name },
            { :locked_at => nil },
            { :locked_at => { '$lt' => (right_now - max_run_time) }}
          )

          criteria = criteria.gte(:priority => Worker.min_priority.to_i) if Worker.min_priority
          criteria = criteria.lte(:priority => Worker.max_priority.to_i) if Worker.max_priority
          criteria = criteria.any_in(:queue => Worker.queues) if Worker.queues.any?

          criteria.desc(:locked_by).asc(:priority).asc(:run_at).find_and_modify(
            {"$set" => {:locked_at => right_now, :locked_by => worker.name}}, :new => true
          )
        end

        # When a worker is exiting, make sure we don't have any locked jobs.
        def self.clear_locks!(worker_name)
          self.where(:locked_by => worker_name).update_all({:locked_at => nil, :locked_by => nil})
        end

        def reload(*args)
          reset
          super
        end
      end
    end
  end
end
