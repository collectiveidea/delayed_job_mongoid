# encoding: utf-8
require 'delayed/backend/mongoid'
require 'delayed/serialization/mongoid'
require 'delayed_job'
require 'delayed/plugins'

Delayed::Worker.backend = :mongoid
