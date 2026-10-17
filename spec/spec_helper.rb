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

# Mongoid 7 and 8 look up the default log level with
# "Logger::INFO".constantize, which JRuby 10 fails to resolve
Mongoid::Config.log_level = Logger::INFO

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

  # The shared examples in delayed_job 4.2.0 expect the Class#method
  # backtrace labels of CRuby 3.4, which JRuby doesn't produce. Fixed in
  # https://github.com/collectiveidea/delayed_job/commit/4c2850c2d6ebefeb98f02210fa6f51c135c8c051
  if RUBY_ENGINE == 'jruby' && Gem.loaded_specs['delayed_job'].version <= Gem::Version.new('4.2.0')
    config.before(:each) do |example|
      skip 'JRuby backtrace labels lack the class name' if example.description == 're-schedules jobs after failing'
    end
  end
end

Mongoid.configure do |config|
  config.connect_to('dl_spec')
end

# Mongoid 7.6 logs a deprecation warning for the criteria cache the
# first time any query runs. Get it out of the way now, so it can't
# land in a logger that the MongoSilencer specs expect to stay empty.
Story.first
