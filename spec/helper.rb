unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end

require 'rspec'
require 'delayed_job_mongoid'
require 'delayed/backend/shared_spec'

Mongoid.configure do |config|
  config.connect_to("dl_spec")
end

class Story
  include ::Mongoid::Document
  def tell; text; end
  def whatever(n, _); tell*n; end
  def self.count; end

  handle_asynchronously :whatever
end
