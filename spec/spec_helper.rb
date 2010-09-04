require 'rubygems'
require 'bundler/setup'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'spec'
require 'spec/autorun'
require 'delayed_job_mongoid'
require 'delayed/backend/shared_spec'

Spec::Runner.configure do |config|
  
end

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

