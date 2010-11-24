# delayed_job Mongoid backend

## Installation

Add the gems to your Gemfile:

    gem 'delayed_job'
    gem 'delayed_job_mongoid'

After running `bundle install`, create the indexes (and don't forget to do this on your production database):

    script/rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'

That's it. Use [delayed_job as normal](http://github.com/collectiveidea/delayed_job).
