module D3
  class SequentialScale
    include D3::Native

    def call(t)
      @native.call(t)
    end

    attribute_d3 :domain
    attribute_d3 :clamp

    def copy
      self.class.new @native.JS.copy
    end

    def interpolator(&block)
      if block_given?
        @native.JS.interpolator(block)
        self
      else
        @native.JS.interpolator
      end
    end
  end

  class << self
    def scale_sequential(&block)
      raise unless block_given?
      SequentialScale.new @d3.JS.scaleSequential(block)
    end

    def interpolate_viridis(t=nil)
      if t
        @d3.JS.interpolateViridis(t)
      else
        `#@d3.interpolateViridis`
      end
    end

    def interpolate_inferno(t=nil)
      if t
        @d3.JS.interpolateInferno(t)
      else
        `#@d3.interpolateInferno`
      end
    end

    def interpolate_magma(t=nil)
      if t
        @d3.JS.interpolateMagma(t)
      else
        `#@d3.interpolateMagma`
      end
    end

    def interpolate_plasma(t=nil)
      if t
        @d3.JS.interpolatePlasma(t)
      else
        `#@d3.interpolatePlasma`
      end
    end

    def interpolate_warm(t=nil)
      if t
        @d3.JS.interpolateWarm(t)
      else
        `#@d3.interpolateWarm`
      end
    end

    def interpolate_cool(t=nil)
      if t
        @d3.JS.interpolateCool(t)
      else
        `#@d3.interpolateCool`
      end
    end

    def interpolate_rainbow(t=nil)
      if t
        @d3.JS.interpolateRainbow(t)
      else
        `#@d3.interpolateRainbow`
      end
    end

    def interpolate_cubehelix_default(t=nil)
      if t
        @d3.JS.interpolateCubehelixDefault(t)
      else
        `#@d3.interpolateCubehelixDefault`
      end
    end
  end
end
