require "spec_helper"
require 'byebug'

RSpec.describe Occupator do

  EventObject = Class.new do
    extend Occupator
    def self.call(*args)
    end
  end

  subject { EventObject }

  it "has a version number" do
    expect(Occupator::VERSION).not_to be nil
  end

  describe Occupator::Config do

    describe '.config' do
      it 'returns a new config object' do
        expect(Occupator.configuration).to be_a(Occupator::Config)
      end

      it 'returns the default config values' do
        config = Occupator::Config.new

        expect(config.default_at).to eq('12.00')
        expect(config.call_method).to eq(:call)
        expect(config.dump_style).to eq(:string)
      end
    end

    describe '.configure' do
      it 'raises an error if no block is passed' do
        expect { Occupator.configure }.to raise_error(RuntimeError)
      end

      it 'passes the config option to the config class' do
        skip 'implement later'
      end
    end
  end

  describe 'Event Object' do
    it 'responds to the occupy method' do
      expect(subject).to respond_to(:occupy)
    end

    it 'invokes the callable method in the event class' do
      expect(subject).to receive(:call).with(:day, '00.00')

      subject.occupy(every: :day, at: '00.00')
    end

    it 'creates a new event' do
      args = { every: :day, at: '00.00' }
      expect(Occupator::Event)
        .to receive(:new)
        .with(args.merge(method: :call, klass: subject))

      subject.occupy(args)
    end
  end
end
