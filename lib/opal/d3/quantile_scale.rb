module D3
  class QuantileScale
    include Native
    def initialize(native)
      raise unless native
      @native = native
    end

    def domain(d=nil)
      if d
        @native.JS.domain(d)
        self
      else
        @native.JS.domain
      end
    end

    def range(r=nil)
      if r
        @native.JS.range(r)
        self
      else
        @native.JS.range
      end
    end

    def call(t)
      @native.call(t)
    end

    alias_native :invert_extent, :invertExtent
    alias_native :quantiles

    def copy
      self.class.new @native.JS.copy
    end
  end

  class << self
    def scale_quantile
      D3::QuantileScale.new @d3.JS.scaleQuantile
    end
  end
end
