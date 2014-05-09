# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
desc 'Run the specs'
RSpec::Core::RakeTask.new do |r|
  r.verbose = false
end

task :test => :spec

begin
  require 'rubocop/rake_task'
  Rubocop::RakeTask.new
rescue LoadError
  task :rubocop do
    $stderr.puts 'Rubocop is disabled'
  end
end

require 'yardstick/rake/measurement'
Yardstick::Rake::Measurement.new do |measurement|
  measurement.output = 'measurement/report.txt'
end

require 'yardstick/rake/verify'
Yardstick::Rake::Verify.new do |verify|
  verify.require_exact_threshold = false
  verify.threshold = 53.3
end

task :default => [:spec, :rubocop, :verify_measurements]
