source 'https://rubygems.org'

gem 'rake'

group :test do
  gem 'rspec', '>= 3'
  gem 'rubocop', '0.65.0'
  gem 'simplecov', '>= 1'
  gem 'simplecov-lcov'
end

# Former default gems that Mongoid 7 and 8 (and the ActiveSupport 7.0
# that Mongoid 7 resolves to) use without depending on them
gem 'base64'
gem 'bigdecimal'
gem 'mutex_m'
gem 'ostruct'

mongoid_version = ENV.fetch('MONGOID_VERSION', nil)
if mongoid_version == 'HEAD'
  gem 'mongoid', github: 'mongodb/mongoid'
elsif mongoid_version
  # '9' selects the newest 9.x and '9.0' the newest 9.0.x
  gem 'mongoid', "~> #{mongoid_version}.0"
end

gemspec
