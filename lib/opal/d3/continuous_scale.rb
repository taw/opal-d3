module D3
  class ContinuousScale
    include Native
    def initialize(native)
      raise unless native
      @native = native
    end

    def call(t)
      @native.call(t)
    end

    def invert(t)
      @native.JS.invert(t)
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

    def clamp(c=nil)
      if c == nil
        @native.JS.clamp
      else
        @native.JS.clamp(!!c)
        self
      end
    end

    def nice(*args)
      @native.JS.nice(*args)
      self
    end

    def copy
      self.class.new @native.JS.copy
    end

    alias_native :ticks
    alias_native :tick_format, :tickFormat
  end

  class PowScale < ContinuousScale
    def exponent(e=nil)
      if e
        self.class.new @native.JS.exponent(e)
      else
        @native.JS.exponent
      end
    end
  end

  class LogScale < ContinuousScale
    def base(b=nil)
      if b
        self.class.new @native.JS.base(b)
      else
        @native.JS.base
      end
    end
  end

  class << self
    def scale_pow
      D3::PowScale.new @d3.JS.scalePow
    end

    def scale_sqrt
      D3::PowScale.new @d3.JS.scaleSqrt
    end

    def scale_linear
      D3::ContinuousScale.new @d3.JS.scaleLinear
    end

    def scale_log
      D3::LogScale.new @d3.JS.scaleLog
    end
  end
end
