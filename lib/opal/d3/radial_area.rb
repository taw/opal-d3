module D3
  class RadialAreaGenerator
    include D3::Native
  end

  class << self
    def radial_area
      D3::RadialAreaGenerator.new @d3.JS.radialArea
    end
  end
end
