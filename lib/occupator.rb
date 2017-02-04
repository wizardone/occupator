require "occupator/version"
require "occupator/config"
require 'byebug'

module Occupator

  def self.configure
    raise 'You must supply a block with config options' unless block_given?

    yield config
  end

  def self.config
    @config ||= Occupator::Config.new
  end

  def occupy(**options)
    every = options[:every] || :day
    at = options[:at] || '12.00'

    call(every, at)
  end
end
