require 'spec_helper'

describe Delayed::Backend::Mongoid::Job do
  it_behaves_like 'a delayed_job backend'

  context 'when job contains two instance variables that reference the same Mongoid document' do
    it 'can serialize and deserialize the job' do
      job = Delayed::Job.create(payload_object: StoryWrapperJob.new)
      expect(job.reload.payload_object).to be_a StoryWrapperJob
    end
  end

  context 'when a serialized Mongoid document no longer exists' do
    let(:yaml) do
      story = Story.create!(text: 'My lost story')
      story.to_yaml.tap { story.destroy }
    end

    around do |example|
      raise_not_found_error = Mongoid.raise_not_found_error
      Mongoid.raise_not_found_error = false
      example.run
    ensure
      Mongoid.raise_not_found_error = raise_not_found_error
    end

    it 'deserializes it as nil if Mongoid does not raise' do
      expect(YAML.load_dj(yaml)).to be_nil
    end
  end

  describe '.before_fork' do
    it 'disconnects Mongoid' do
      expect(::Mongoid).to receive(:disconnect_clients)
      Delayed::Job.before_fork
    end
  end

  describe '.after_fork' do
    # ensure Mongoid is connected
    before { ::Delayed::Job.first }

    it 'reconnects Mongoid' do
      expect_any_instance_of(::Mongo::Client).to receive(:close)
      expect_any_instance_of(::Mongo::Client).to receive(:reconnect)
      Delayed::Job.after_fork
    end
  end

  context 'custom job class' do
    let(:custom_job_class) do
      Class.new do
        include ::Mongoid::Document
        store_in(collection: :my_jobs)
        include ::Delayed::Backend::Mongoid::Mixin
      end
    end

    it 'can use a custom job class' do
      expect(custom_job_class.collection.name).to eq 'my_jobs'
      expect(::Delayed::Job.all.count).to eq 0
      expect(custom_job_class.all.count).to eq 0
      custom_job_class.enqueue(StoryWrapperJob.new)
      expect(::Delayed::Job.all.count).to eq 0
      expect(custom_job_class.count).to eq 1
      expect(custom_job_class.all.first.reload.payload_object).to be_a StoryWrapperJob
    end
  end
end
