require 'helper'

if ::Mongoid::Compatibility::Version.mongoid3?
  describe Delayed::Backend::Mongoid::Job do
    let(:worker) { Delayed::Worker.new }
    before do
      Delayed::Worker.max_priority = nil
      Delayed::Worker.min_priority = nil
      Delayed::Worker.default_priority = 99
      Delayed::Worker.delay_jobs = true
      SimpleJob.runs = 0
      described_class.delete_all
    end
    after do
      Delayed::Worker.reset
    end
    it 'clears mongoid identity map' do
      expect(Mongoid::IdentityMap).to receive(:clear).once
      described_class.enqueue SimpleJob.new, :priority => 5
      worker.work_off
    end
  end
end
