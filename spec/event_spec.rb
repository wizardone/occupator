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
end
