require 'occupator/version'
require 'occupator/config'
require 'occupator/store'
require 'occupator/event'
require 'byebug'

module Occupator

  class << self
    attr_accessor :configuration

    def configure
      raise 'No configuration block supplied' unless block_given?
      yield configuration
    end

    def configuration
      @configuration ||= Occupator::Config.new
    end
  end

  def occupy(**options)
    every = options[:every] || :day
    at = options[:at] || '12.00'
    call_method = Occupator.configuration.call_method || options[:method]
    Occupator::Event.new(every: every, at: at, klass: self, method: call_method).register

    #public_send(call_method, every, at) if respond_to?(call_method)
  end

  def dump
    Occupator::Store.dump
  end
end
