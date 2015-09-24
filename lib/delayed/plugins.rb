#
# clear Mongoid::IdentityMap before each job
#

if ::Mongoid::Compatibility::Version.mongoid3?
  module Delayed
    module Plugins
      class ClearIdentityMap < Plugin
        callbacks do |lifecycle|
          lifecycle.before(:invoke_job) do
            Mongoid::IdentityMap.clear
          end
        end
      end
    end
  end

  Delayed::Worker.plugins << Delayed::Plugins::ClearIdentityMap
end
