source 'https://rubygems.org'

gem 'rake'

group :test do
  gem 'backports'
  gem 'coveralls', :require => false
  gem 'mime-types', '~> 1.25', :platforms => [:jruby, :ruby_18]
  gem 'rspec', '>= 2.14'
  gem 'rubocop', '>= 0.23', :platforms => [:ruby_19, :ruby_20, :ruby_21]
  gem 'simplecov', :require => false
  gem 'yardstick'
end

case version = ENV['MONGOID_VERSION'] || '~> 3.1'
when /4/
  gem 'mongoid', :github => 'mongoid/mongoid'
when /3/
  gem 'mongoid', '~> 3.1'
else
  gem 'mongoid', version
end

gemspec
