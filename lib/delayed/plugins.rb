#
# clear Mongoid::IdentityMap before each job
#

module Delayed
  module Plugins
    class ClearIdentityMap < Plugin
      callbacks do |lifecycle|
        lifecycle.before(:invoke_job) do |worker, &block|
          Mongoid::IdentityMap.clear
        end
      end
    end
  end
end

Delayed::Worker.plugins << Delayed::Plugins::ClearIdentityMap
