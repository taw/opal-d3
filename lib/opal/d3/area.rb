module D3
  class AreaGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def area
      D3::AreaGenerator.new @d3.JS.area
    end
  end
end
