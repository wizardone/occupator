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
        if Occupator.configuration.dump_style == :string
          dump_string_for(period)
        elsif Occupator.configuration.dump_style == :hash
          dump_hash_for(period)
        end
      end

      private

      def events_for(period)
        events.select { |k, _v| k.to_sym == period}
      end

      def dump_string_for(period)
        ''.tap do |dump_string|
          (period == :all ? events : events_for(period)).each do |key, event|
            next if event.empty?
            event = event.first
            dump_string << %Q{Event: #{event.klass.class}, Every #{event.every}, At #{event.at} \n}
          end
        end
      end

      def dump_hash_for(period)
        {}.tap do |dump_hash|
          (period == :all ? events : events_for(period)).each do |key, event|
            next if event.empty?
            event = event.first
            dump_hash[event.uuid] = {
              every: event.every,
              at: event.at,
              klass: event.klass
            }
          end
        end
      end
    end
  end
end
