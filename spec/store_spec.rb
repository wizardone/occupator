require 'spec_helper'

describe Occupator::Store do
  subject { described_class }

  it 'is a singleton' do
    expect {
      subject.new
    }.to raise_error(NoMethodError)
  end

  before { subject.clear }

  describe '.events' do
    it 'returns an empty hash of events' do
      expect(subject.events).to eq(hour: [], day: [], week: [], month: [])
    end

    context 'single recurring event' do
      it 'returns the events that occur every day' do
        event = Occupator::Event.new(every: :day, at: :noon, method: :call)
        subject[:day] = event

        expect(subject.events).to_not be_empty
        expect(subject.events[:day]).to eq([event])
      end

      it 'returns the events that occur every week' do
        event = Occupator::Event.new(every: :week, at: :noon, method: :call)
        subject[:week] = event

        expect(subject.events).to_not be_empty
        expect(subject.events[:week]).to eq([event])
      end

      it 'returns the events that occur every month' do
        event = Occupator::Event.new(every: :month, at: :noon, method: :call)
        subject[:month] = event

        expect(subject.events).to_not be_empty
        expect(subject.events[:month]).to eq([event])
      end

      it 'returns the events that occur every hour' do
        event = Occupator::Event.new(every: :hour, at: :noon, method: :call)
        subject[:hour] = event

        expect(subject.events).to_not be_empty
        expect(subject.events[:hour]).to eq([event])
      end
    end

    context 'multiple recurring events' do
      it 'returns a hash with all the events for a given period' do
        event = Occupator::Event.new(every: :hour, at: :noon, method: :call)

        3.times { |i| subject[:hour] = event }

        expect(subject.events).to_not be_empty
        expect(subject.events[:hour].length).to eq(3)
      end
    end
  end

  describe '.dump' do
    it 'dumps the event information in a human readable form' do
      event1 = Occupator::Event.new(every: :day, at: :noon, method: :call)
      event2 = Occupator::Event.new(every: :week, at: :noon, method: :call)
      subject[:day] = event1
      subject[:week] = event2

      expect(subject.dump)
        .to eq('Event: Class , Every day, At noon \nEvent: Class , Every week, At noon \n')
    end
  end
end
