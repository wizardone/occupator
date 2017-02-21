require 'spec_helper'

describe Occupator::Store do
  subject { described_class }

  it 'is a singleton' do
    expect {
      subject.new
    }.to raise_error(NoMethodError)
  end

  describe '.events' do
    it 'returns an empty hash of events' do
      expect(subject.events).to eq({})
    end

    it 'returns a hash of events if any are present' do
      event = Occupator::Event.new(every: :day, at: :noon, method: :call)
      subject.events[:day] = event

      expect(subject.events).to_not be_empty
      expect(subject.events).to eq(day: event)
    end
  end
end
