require 'spec_helper'

describe Delayed::Plugins::MongoSilencer do
  let(:mongoid_io) { StringIO.new }
  let(:mongoid_logger) { ActiveSupport::Logger.new(mongoid_io) }
  let(:mongo_io) { StringIO.new }
  let(:mongo_logger) { ActiveSupport::Logger.new(mongo_io) }
  let(:run_worker) do
    worker = Delayed::Worker.new
    thread = Thread.new { worker.start }
    sleep(0.5)
    worker.stop
    thread.join
  end

  before do
    Delayed::Job.create(payload_object: StoryWrapperJob.new)
    Mongoid.logger = mongoid_logger
    Mongo::Logger.logger = mongo_logger
    Delayed::Worker.sleep_delay = 0.1
  end

  after do
    Delayed::Worker.reset
    Delayed::Worker.plugins = []
    Mongoid.logger = $mongoid_logger
    Mongo::Logger.logger = $mongo_logger
  end

  context 'when plugin is set' do
    before do
      Delayed::Worker.plugins << described_class
    end

    context 'when using ActiveSupport::Logger' do
      it do
        run_worker
        expect(mongoid_io.string.lines.size).to eq 0
        expect(mongo_io.string.lines.any? { |l| l.include?('"find"=>"stories"') }).to eq true
        expect(mongo_io.string.lines.any? { |l| l.include?('"findAndModify"=>"delayed_backend_mongoid_jobs"') }).to eq false
      end
    end

    context 'when Mongo logger is a Logger' do
      let(:mongo_logger) { Logger.new(mongo_io) }

      it do
        run_worker
        expect(mongo_io.string.lines.any? { |l| l.include?('"find"=>"stories"') }).to eq true
        expect(mongo_io.string.lines.any? { |l| l.include?('"findAndModify"=>"delayed_backend_mongoid_jobs"') }).to eq true
      end
    end
  end

  context 'when plugin is not set' do
    it do
      run_worker
      expect(mongoid_io.string.lines.size).to eq 0
      expect(mongo_io.string.lines.any? { |l| l.include?('"find"=>"stories"') }).to eq true
      expect(mongo_io.string.lines.any? { |l| l.include?('"findAndModify"=>"delayed_backend_mongoid_jobs"') }).to eq true
    end
  end
end
