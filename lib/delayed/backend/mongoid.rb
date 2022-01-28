require 'mongoid'
require 'delayed/backend/mongoid_mixin'

module Delayed
  module Backend
    module Mongoid
      class Job
        include ::Delayed::Backend::Mongoid::Mixin
      end
    end
  end
end
