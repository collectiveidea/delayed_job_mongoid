require 'helper'
require 'models/story'
require 'models/story_wrapper_job'

describe Delayed::Backend::Mongoid::Job do
  it_behaves_like 'a delayed_job backend'

  context 'when job contains two instance variables that reference the same Mongoid document' do
    it 'can serialize and deserialize the job' do
      job = Delayed::Job.create payload_object: StoryWrapperJob.new
      expect(job.reload.payload_object).to be_a StoryWrapperJob
    end
  end
end
