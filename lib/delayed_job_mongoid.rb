# encoding: utf-8
require 'delayed/backend/mongoid'
require 'delayed/serialization/mongoid'
require 'delayed_job'
require 'delayed/plugins'
require 'delayed/yaml/yaml_ext'

Delayed::Worker.backend = :mongoid
