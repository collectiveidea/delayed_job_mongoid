require 'helper'

class StoryWrapperJob < SimpleJob
  def initialize
    @story = Story.create!(:text => 'My great story')
    @story_again = @story
  end

  def perform
    @story.tell
    super
  end
end

describe Delayed::Backend::Mongoid::Job do
  it_behaves_like 'a delayed_job backend'


  context 'when job contains two instance variables that reference the same Mongoid document' do
    it 'can serialize and deserialize the job' do
      job = Delayed::Job.create :payload_object => StoryWrapperJob.new
      expect(job.reload.payload_object).to be_a StoryWrapperJob
    end
  end
end
