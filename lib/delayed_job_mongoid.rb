# encoding: utf-8
require 'delayed/backend/mongoid'
require 'delayed/serialization/mongoid'
require 'delayed_job'

Delayed::Worker.backend = :mongoid
