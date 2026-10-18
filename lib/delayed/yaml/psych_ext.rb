module Delayed
  module PsychExt
    class ToRuby < Psych::Visitors::ToRuby
      # see https://github.com/collectiveidea/delayed_job_mongoid/pull/65
      alias _visit_Psych_Nodes_Mapping visit_Psych_Nodes_Mapping

      def visit_Psych_Nodes_Mapping(object) # rubocop:disable MethodName
        document = _visit_Psych_Nodes_Mapping(object)
        register(object, document) if document
        document
      end
    end
  end
end
