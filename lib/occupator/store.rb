require 'singleton'
module Occupator
  class Store
    include Singleton

    @@events = {
      hour: [],
      day: [],
      week: [],
      month: []
    }

    class << self

      def events
        @@events
      end

      def []=(period, event)
        events[period.to_sym] << event
      end

      def clear
        @@events = {
          hour: [],
          day: [],
          week: [],
          month: []
        }
      end

      def dump
        ''.tap do |dump_string|
          @@events.each do |event|

            dump_string << "Event: Every #{event.every} at #{event.at} \n"
          end
        end
      end
    end
  end
end
