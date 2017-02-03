require "spec_helper"
require 'byebug'

RSpec.describe Occupator do
  subject do
    class EventObject
      extend Occupator
    end
  end
  it "has a version number" do
    expect(Occupator::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end


  describe 'Event Object' do
    it 'responds to the occupy method' do
      expect(subject).to respond_to(:occupy)
    end
  end
end
