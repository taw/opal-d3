# all these methods return indexes not values
module D3
  class Bisector
    def initialize(&block)
      @native = `window.d3`.JS.bisector(block)
    end

    include Native
    alias_native :left
    alias_native :right
  end

  class << self
    alias_d3 :ascending
    alias_d3 :descending
    alias_d3 :bisect
    alias_d3 :bisect_left, :bisectLeft
    alias_d3 :bisect_right, :bisectRight

    def scan(array, &block)
      if block_given?
        @d3.JS.scan(array, block)
      else
        @d3.JS.scan(array)
      end
    end

    def bisector(&block)
      D3::Bisector.new(&block)
    end
  end
end
