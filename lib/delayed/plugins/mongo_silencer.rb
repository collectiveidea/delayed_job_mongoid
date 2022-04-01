require 'mongo'
require 'delayed/plugin'

module Delayed
  module Plugins
    # Silences the Mongo logger except when performing jobs.
    # Requires the Mongoid/Mongo loggers to be instances of ActiveSupport::Logger.
    class MongoSilencer < Delayed::Plugin
      callbacks do |lifecycle|
        lifecycle.before(:execute) do |*_args|
          store_log_level
          silence!
        end

        # As of Delayed Job 4.10, the :perform hook includes the
        # operations for job deletion and job errors, so these will
        # still appear in the log.
        lifecycle.around(:perform) do |*_args, &block|
          begin
            unsilence!
            block.call
          ensure
            silence!
          end
        end
      end

      class << self
        def store_log_level
          @mongo_log_level = Mongo::Logger.logger.level if mongo_logger?
        end

        def silence!
          Mongo::Logger.logger.local_level = Logger::WARN if @mongo_log_level && mongo_logger?
        end

        def unsilence!
          Mongo::Logger.logger.local_level = @mongo_log_level if @mongo_log_level && mongo_logger?
        end

        private

        def mongo_logger?
          Mongo::Logger.logger && Mongo::Logger.logger.respond_to?(:local_level)
        end
      end
    end
  end
end
