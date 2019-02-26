# DelayedJob Mongoid backend

[![Gem Version](https://badge.fury.io/rb/delayed_job_mongoid.svg)](http://badge.fury.io/rb/delayed_job_mongoid)
[![Build Status](https://travis-ci.org/collectiveidea/delayed_job_mongoid.svg?branch=master)](https://travis-ci.org/collectiveidea/delayed_job_mongoid)
[![Code Climate](https://codeclimate.com/github/collectiveidea/delayed_job_mongoid.svg)](https://codeclimate.com/github/collectiveidea/delayed_job_mongoid)
[![Coverage Status](https://coveralls.io/repos/collectiveidea/delayed_job_mongoid/badge.svg?branch=master&service=github)](https://coveralls.io/github/collectiveidea/delayed_job_mongoid?branch=master)

[gem]: https://rubygems.org/gems/delayed_job_mongoid
[travis]: http://travis-ci.org/collectiveidea/delayed_job_mongoid
[codeclimate]: https://codeclimate.com/github/collectiveidea/delayed_job_mongoid
[coveralls]: https://coveralls.io/r/collectiveidea/delayed_job_mongoid

## Requirements

Mongoid 3, 4, 5, 6 or 7.

## Installation

Add the gem to your Gemfile:

    gem 'delayed_job_mongoid'

Create the indexes (and don't forget to do this on your production database):

    script/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'

To generate `script/delayed_job`:

    rails generate delayed_job

That's it. Use [delayed_job](http://github.com/collectiveidea/delayed_job) as
normal.
