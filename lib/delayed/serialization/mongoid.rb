Mongoid::Document.class_eval do
  yaml_as "tag:ruby.yaml.org,2002:Mongoid"
  
  def self.yaml_new(klass, tag, val)
    begin
      klass.find(val['attributes']['_id'])
    rescue Mongoid::Errors::DocumentNotFound
      nil
    end
  end
  
  def to_yaml_properties
    ['@attributes']
  end
end

