module Occupator
  class Config
    attr_accessor :default_at

    def initialize
      @default_at = '12.00'
    end
  end
end
