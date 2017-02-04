require "occupator/version"
require "occupator/config"
require 'byebug'

module Occupator

  class << self
    attr_accessor :configuration
    def configuration
      configuration ||= Occupator::Config.new
    end
  end

  def self.configure
    raise 'You must supply a block with config options' unless block_given?

    yield configuration
  end

  def occupy(**options)
    every = options[:every] || :day
    at = options[:at] || '12.00'

    call(every, at)
  end
end
