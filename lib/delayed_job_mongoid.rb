require 'delayed/backend/mongoid_mixin'
require 'delayed/backend/mongoid'
require 'delayed/serialization/mongoid'
require 'delayed_job'
require 'delayed/yaml/yaml_ext'

Delayed::Worker.backend = :mongoid
