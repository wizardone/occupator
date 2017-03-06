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
          (period == :all ? events : events.select { |k, _v| k.to_sym == period}).each do |key, event|
            next if event.empty?
            event = event.first
            dump_string << %Q{Event: Class #{event.klass}, Every #{event.every}, At #{event.at} \n}
          end
        end
      end
    end
  end
end
