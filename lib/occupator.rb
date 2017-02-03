require "occupator/version"

module Occupator

  def occupy(**options)
    every = options[:every] || :day
    call(every, at)
  end
end
