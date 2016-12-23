module D3
  class SymbolGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def symbol
      D3::SymbolGenerator.new @d3.JS.symbol
    end
  end
end
