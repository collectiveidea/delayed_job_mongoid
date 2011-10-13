# encoding: utf-8
Mongoid::Document.class_eval do
  yaml_as "tag:ruby.yaml.org,2002:Mongoid"

  def self.yaml_new(klass, tag, val)
    begin
      klass.find(val['_id'])
    rescue Mongoid::Errors::DocumentNotFound
      raise Delayed::DeserializationError
    end
  end

  def to_yaml_properties
    ['@_id']
  end
end

