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

  describe 'Event Object' do
    it 'responds to the occupy method' do
      expect(subject).to respond_to(:occupy)
    end

    it 'invokes the callable method in the event class' do
      expect(subject).to receive(:call).with(:day, '00.00')

      subject.occupy(every: :day, at: '00.00')
    end
  end
end
