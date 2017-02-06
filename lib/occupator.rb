require "occupator/version"
require "occupator/config"
require 'byebug'

module Occupator

  class << self
    attr_accessor :configuration
    def configuration
      configuration ||= Occupator::Config.new
    end

    def configure
      raise 'You must supply a block with config options' unless block_given?

      yield configuration
    end
  end

  def occupy(**options)
    every = options[:every] || :day
    at = options[:at] || '12.00'
    call_method = Occupator.configuration.call_method

    public_send(call_method, every, at) if respond_to?(call_method)
  end
end
