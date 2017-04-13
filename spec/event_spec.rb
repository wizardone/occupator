require 'spec_helper'

describe Occupator::Event do
  subject { described_class }

  describe '#initialize' do
    it 'receives and assigns the arguments' do
      event = subject.new(every: :day, at: '0900')

      expect(event.every).to eq(:day)
      expect(event.at).to eq('0900')
      expect(event.uuid).to_not be_empty
    end
  end

  describe '#register' do
    it 'registers the event in the store' do
      event = subject.new(every: :day, at: :noon)

      expect(Occupator::Store).to receive(:events).with(event.every)

      event.register
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the event' do
      event = subject.new(every: :day, at: :noon, klass: Class)

      expect(event.to_hash).to eq(uuid: event.uuid,
                                  every: event.every,
                                  at: event.at,
                                  klass: event.klass)
    end
  end
end
