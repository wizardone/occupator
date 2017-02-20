module Occupator
  class Event

    attr_reader :every, :at
    def initialize(**args)
      @every = args[:every]
      @at = args[:at]
    end
  end
end
