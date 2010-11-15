require 'rubygems'
require 'bundler/setup'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'
require 'delayed_job_mongoid'
require 'delayed/backend/shared_spec'

Mongoid.configure do |config|
  config.master = config.master = Mongo::Connection.new.db('dl_spec')
end

class Story
  include ::Mongoid::Document
  def tell; text; end
  def whatever(n, _); tell*n; end
  def self.count; end

  handle_asynchronously :whatever
end

