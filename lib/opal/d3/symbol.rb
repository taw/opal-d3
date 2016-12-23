module D3
  class SymbolGenerator
    include D3::Native
  end

  class << self
    def symbol
      D3::SymbolGenerator.new @d3.JS.symbol
    end
  end
end
