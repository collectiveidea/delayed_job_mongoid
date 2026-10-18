unless defined?(JRUBY_VERSION)
  require 'simplecov'
  require 'simplecov-lcov'

  SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = 'coverage/lcov.info'
  end
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::LcovFormatter
  ]
  SimpleCov.start do
    skip '/spec/'
    minimum_coverage(76.39)
  end
end

require 'rspec'
require 'delayed_job_mongoid'
require 'delayed/plugins/mongo_silencer'
require 'delayed/backend/shared_spec'
require 'models/story'
require 'models/story_wrapper_job'

$mongoid_logger = Mongoid.logger
$mongo_logger = Mongo::Logger.logger

RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Mongoid.logger.level = Logger::INFO
    Mongo::Logger.logger.level = Logger::INFO
  end

  config.before(:each) do
    Mongoid.purge!
  end
end

Mongoid.configure do |config|
  config.connect_to('dl_spec')
end
