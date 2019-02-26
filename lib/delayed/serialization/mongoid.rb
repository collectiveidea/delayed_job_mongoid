require 'delayed_job'
require 'mongoid'

if YAML.parser.class.name =~ /syck/i
  Mongoid::Document.class_eval do
    yaml_as 'tag:ruby.yaml.org,2002:Mongoid'

    def self.yaml_new(klass, _, val)
      klass.find(val['attributes']['_id'])
    rescue Mongoid::Errors::DocumentNotFound
      raise Delayed::DeserializationError
    end

    def to_yaml_properties
      ['@attributes']
    end
  end
else
  Mongoid::Document.class_eval do
    def encode_with(coder)
      coder['attributes'] = @attributes
      coder.tag = ['!ruby/Mongoid', self.class.name].join(':')
    end
  end
end
