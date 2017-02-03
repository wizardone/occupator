require "occupator/version"

module Occupator

  def occupy(**options)
    every = options[:every] || :day
    at = options[:at] || '12.00'

    call(every, at)
  end
end
