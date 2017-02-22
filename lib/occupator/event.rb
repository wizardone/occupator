require 'securerandom'

module Occupator
  class Event

    attr_reader :every, :at, :klass, :uuid

    def initialize(**args)
      @every = args[:every]
      @at = args[:at]
      @klass = args[:klass]
      @uuid = SecureRandom.uuid
    end

    def register
      Occupator::Store.events[every] = self
    end

    def next

    end

    def previous

    end
  end
end
