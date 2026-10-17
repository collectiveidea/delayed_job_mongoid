# Delayed::Job Mongoid backend

[![Gem Version](https://badge.fury.io/rb/delayed_job_mongoid.svg)][gem]
[![CI](https://github.com/collectiveidea/delayed_job_mongoid/actions/workflows/ci.yml/badge.svg)][ci]
[![Coverage Status](https://coveralls.io/repos/github/collectiveidea/delayed_job_mongoid/badge.svg?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/delayed_job_mongoid
[ci]: https://github.com/collectiveidea/delayed_job_mongoid/actions/workflows/ci.yml
[coveralls]: https://coveralls.io/github/collectiveidea/delayed_job_mongoid?branch=master

A [Mongoid](https://github.com/mongodb/mongoid) backend for
[delayed_job](https://github.com/collectiveidea/delayed_job).

See the [CHANGELOG](CHANGELOG.md) for what's new in each release.

## Requirements

delayed_job_mongoid requires Ruby 3.2 or later and Mongoid 7 or later. It is
tested against Mongoid 7, 8 and 9.

For Mongoid 5 and 6, use version 3.0 of this gem. For Mongoid 3 and 4, use
version 2.x.

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'delayed_job_mongoid'
```

Then create the indexes (don't forget to do this in production):

```
bin/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'
```

To generate `bin/delayed_job`:

```
bin/rails generate delayed_job
```

That's it. Use [delayed_job](https://github.com/collectiveidea/delayed_job) as normal.

## Advanced Usage

### Silencing Noisy Logging

By default, the Mongo Ruby Driver will print log lines every
5 seconds as Delayed Job polls your database. Use the following
plugin to silence logs which happen while polling (except `error`
level) and only log operations which happen during job execution.

```ruby
# in config/initializers/delayed_job.rb

require 'delayed/plugins/mongo_silencer'
Delayed::Worker.plugins << Delayed::Plugins::MongoSilencer
```

To ensure thread safety, this plugin requires your `Mongo::Logger.logger`
to be an instance of `ActiveSupport::Logger` class. It will ignore instances
of the Ruby standard library `Logger` class.

### Customizing Job Class

Delayed Job allows specifying a custom backend class for jobs.
For example, you may wish to specify a different database
collection name. To do this:

```ruby
# in an initializer

class MyJob
  include Mongoid::Document

  store_in(collection: :my_jobs)

  include Delayed::Backend::Mongoid::Mixin
end

Delayed::Worker.backend = MyJob

# in your application

MyJob.enqueue(job_object)
```
