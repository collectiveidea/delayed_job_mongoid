source 'https://rubygems.org'

gem 'rake'

group :test do
  gem 'backports'
  gem 'coveralls'
  gem 'mime-types', '~> 1.25', :platforms => [:jruby, :ruby_18]
  gem 'rest-client', '~> 1.6.0', :platforms => [:jruby, :ruby_18]
  gem 'rspec', '>= 3'
  gem 'rubocop', '>= 0.28'
  gem 'simplecov', '>= 0.9'
  gem 'yardstick'
end

case version = ENV['MONGOID_VERSION'] || '5.0'
when /^5/
  gem 'mongoid', '~> 5.0'
when /^4/
  gem 'mongoid', '~> 4.0'
when /^3/
  gem 'mongoid', '~> 3.1'
else
  gem 'mongoid', version
end

gemspec
