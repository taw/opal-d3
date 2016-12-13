module D3
  class ThresholdScale
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

    def invert_extent(t)
      a,b = @native.JS.invertExtent(t)
      [`a === undefined ? nil : a`, `b === undefined ? nil : b`]
    end

    def copy
      self.class.new @native.JS.copy
    end
  end

  class << self
    def scale_threshold
      D3::ThresholdScale.new @d3.JS.scaleThreshold
    end
  end
end
