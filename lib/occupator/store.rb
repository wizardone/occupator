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

      def dump(period = :all)
        ''.tap do |dump_string|
          (period == :all ? events : events_for(period)).each do |key, event|
            next if event.empty?
            event = event.first
            dump_string << %Q{Event: #{event.klass.class}, Every #{event.every}, At #{event.at} \n}
          end
        end
      end

      private

      def events_for(period)
        events.select { |k, _v| k.to_sym == period}
      end
    end
  end
end
