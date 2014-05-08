# DelayedJob Mongoid backend

[![Gem Version](http://img.shields.io/gem/v/delayed_job_mongoid.svg)][gem]
[![Build Status](http://img.shields.io/travis/collectiveidea/delayed_job_mongoid.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/collectiveidea/delayed_job_mongoid.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/collectiveidea/delayed_job_mongoid.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/collectiveidea/delayed_job_mongoid.svg)][coveralls]

[gem]: https://rubygems.org/gems/delayed_job_mongoid
[travis]: http://travis-ci.org/collectiveidea/delayed_job_mongoid
[gemnasium]: https://gemnasium.com/collectiveidea/delayed_job_mongoid
[codeclimate]: https://codeclimate.com/github/collectiveidea/delayed_job_mongoid
[coveralls]: https://coveralls.io/r/collectiveidea/delayed_job_mongoid

## Requirements

Make sure you are using MongoDB version 1.3 or newer. `delayed_job_mongoid`
uses the `findandmodify` command which is only available in recent versions.

## Installation

Add the gem to your Gemfile:

    gem 'delayed_job_mongoid'

After running `bundle install`, create the indexes (and don't forget to do this
on your production database):

    script/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'

To generate script/delayed_job:

    rails generate delayed_job

That's it. Use [delayed_job](http://github.com/collectiveidea/delayed_job) as
normal.
