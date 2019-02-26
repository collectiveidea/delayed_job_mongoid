require 'yaml'

require File.expand_path('psych_ext', __dir__) unless YAML.parser.class.name =~ /syck|yecht/i
