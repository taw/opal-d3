module D3
  class LineGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def line
      D3::LineGenerator.new @d3.JS.line
    end
  end
end
