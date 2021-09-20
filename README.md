# DelayedJob Mongoid backend

[![Gem Version][gem-img]][gem-url]
[![Build Status][ghactions-img]][ghactions-url]
[![Code Climate][codeclimate-img]][codeclimate-url]
[![Coverage][coveralls-img]][coveralls-url]

## Requirements

Delayed Job Mongoid supports the following dependency versions:

- Ruby 2.3+
- Mongoid 5+

For Mongoid 3 and 4, use 2.x version of this gem.

## Installation

Add the gem to your Gemfile:

```ruby
gem 'delayed_job_mongoid'
```

Then create the indexes (don't forget to do this in production):

```
script/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'
```

To generate `script/delayed_job`:

```
rails generate delayed_job
```

That's it. Use [delayed_job](http://github.com/collectiveidea/delayed_job) as normal.

[gem-img]: https://badge.fury.io/rb/delayed_job_mongoid.svg
[gem-url]: https://rubygems.org/gems/delayed_job_mongoid
[ghactions-img]: https://github.com/collectiveidea/delayed_job_mongoid/actions/workflows/test.yml/badge.svg?query=branch%3Amaster
[ghactions-url]: https://github.com/collectiveidea/delayed_job_mongoid/actions/workflows/test.yml?query=branch%3Amaster
[codeclimate-img]: https://codeclimate.com/github/collectiveidea/delayed_job_mongoid.svg
[codeclimate-url]: https://codeclimate.com/github/collectiveidea/delayed_job_mongoid
[coveralls-img]: https://coveralls.io/github/collectiveidea/delayed_job_mongoid/badge.svg?branch=master
[coveralls-url]: https://coveralls.io/github/collectiveidea/delayed_job_mongoid?branch=master
