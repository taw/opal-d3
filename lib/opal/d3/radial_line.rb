module D3
  class RadialLineGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def radial_line
      D3::RadialLineGenerator.new @d3.JS.radialLine
    end
  end
end
