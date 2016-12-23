module D3
  class LineGenerator
    def initialize(native)
      raise unless native
      @native = native
    end

    def call(*args)
      @native.call(*args)
    end

    attribute_d3_block :x
    attribute_d3_block :y
  end

  class << self
    def line
      D3::LineGenerator.new @d3.JS.line
    end
  end
end
