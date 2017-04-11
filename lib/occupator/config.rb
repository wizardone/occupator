module Occupator
  class Config
    attr_accessor :default_at, :call_method, :dump_style

    def initialize
      @default_at = '12.00'
      @call_method = :call
      @dump_style = String
    end
  end
end
