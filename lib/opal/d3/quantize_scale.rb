module D3
  class QuantizeScale
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
    alias_native :ticks
    alias_native :tick_format, :tickFormat

    def nice(*args)
      @native.JS.nice(*args)
      self
    end

    def copy
      self.class.new @native.JS.copy
    end
  end

  class << self
    def scale_quantize
      D3::QuantizeScale.new @d3.JS.scaleQuantize
    end
  end
end
