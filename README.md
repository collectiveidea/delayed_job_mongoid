# delayed_job Mongoid backend [![Build Status](https://secure.travis-ci.org/collectiveidea/delayed_job_mongoid.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/collectiveidea/delayed_job_mongoid.png?travis)][gemnasium] [![Code Climate](https://codeclimate.com/badge.png)][codeclimate]

[travis]: http://travis-ci.org/collectiveidea/delayed_job_mongoid
[gemnasium]: https://gemnasium.com/collectiveidea/delayed_job_mongoid
[codeclimate]: https://codeclimate.com/github/collectiveidea/delayed_job_mongoid

## Requirements

Make sure you are using MongoDB version 1.3 or newer. `delayed_job_mongoid` uses the `findandmodify` command which is only available in recent versions.


## Installation

Add the gem to your Gemfile:

    gem 'delayed_job_mongoid'

After running `bundle install`, create the indexes (and don't forget to do this on your production database):

    script/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'

That's it. Use [delayed_job as normal](http://github.com/collectiveidea/delayed_job).
