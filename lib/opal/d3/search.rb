# all these methods return indexes not values
module D3
  class Bisector
    include D3::Native
    alias_native :left
    alias_native :right
  end

  class << self
    alias_d3 :ascending
    alias_d3 :descending
    alias_d3 :bisect
    alias_d3 :bisectLeft
    alias_d3 :bisectRight

    def scan(array, &block)
      if block_given?
        @d3.JS.scan(array, block)
      else
        @d3.JS.scan(array)
      end
    end

    def bisector(&block)
      D3::Bisector.new @d3.JS.bisector(block)
    end
  end
end
