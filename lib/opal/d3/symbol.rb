module D3
  class SymbolGenerator
    include D3::Native

    def call(*args)
      @native.call(*args)
    end

    attribute_d3_block :size

    def type(new_value=`undefined`, &block)
      if block_given?
        @native.JS.type{|*args| yield(*args).to_n}
        self
      elsif `new_value === undefined`
        D3::SymbolType.new @native.JS.type
      else
        @native.JS.type(new_value.to_n)
        self
      end
    end

    def type=(new_value)
      @native.type(new_value.to_n)
      self
    end
  end

  class SymbolType
    include D3::Native
  end

  class << self
    def symbol
      D3::SymbolGenerator.new @d3.JS.symbol
    end

    def symbols
      `window.d3.symbols`.map{|st| D3::SymbolType.new(st)}
    end

    def symbol_circle
      D3::SymbolType.new `window.d3.symbolCircle`
    end

    def symbol_cross
      D3::SymbolType.new `window.d3.symbolCross`
    end

    def symbol_diamond
      D3::SymbolType.new `window.d3.symbolDiamond`
    end

    def symbol_square
      D3::SymbolType.new `window.d3.symbolSquare`
    end

    def symbol_star
      D3::SymbolType.new `window.d3.symbolStar`
    end

    def symbol_triangle
      D3::SymbolType.new `window.d3.symbolTriangle`
    end

    def symbol_wye
      D3::SymbolType.new `window.d3.symbolWye`
    end
  end
end
