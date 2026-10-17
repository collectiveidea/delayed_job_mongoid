require 'delayed_job'
require 'mongoid'

Mongoid::Document.class_eval do
  def encode_with(coder)
    coder['attributes'] = @attributes
    coder.tag = ['!ruby/Mongoid', self.class.name].join(':')
  end
end
