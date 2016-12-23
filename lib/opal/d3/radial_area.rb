module D3
  class RadialAreaGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def radial_area
      D3::RadialAreaGenerator.new @d3.JS.radialArea
    end
  end
end
