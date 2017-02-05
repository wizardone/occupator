module Occupator
  class Config
    attr_accessor :default_at, :call_method

    def initialize
      @default_at = '12.00'
      @call_method = :call
    end
  end
end
