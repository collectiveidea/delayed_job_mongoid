source 'https://rubygems.org'

gem 'rake'

group :test do
  gem 'coveralls', :require => false
  gem 'rspec', '>= 2.11'
  gem 'simplecov', :require => false
end

gemspec

case version = ENV['MONGOID_VERSION'] || '~> 3.1'
when /4/
  gem 'mongoid', github: 'mongoid/mongoid'
when /3/
  gem 'mongoid', '~> 3.1'
else
  gem 'mongoid', version
end
