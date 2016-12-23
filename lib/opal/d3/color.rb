module D3
  class Color
    include D3::Native
    attr_reader :native
    alias_native :to_s, :toString
    alias_native_new :brighter
    alias_native_new :darker
    alias_native :displayable?, :displayable
    alias_native_new :rgb

    # Various subsets of these are valid depending on color - maybe we should properly subclass?
    def a; `#@native.a` end
    def b; `#@native.b` end
    def c; `#@native.c` end
    def g; `#@native.g` end
    def h; `#@native.h` end
    def l; `#@native.l` end
    def r; `#@native.r` end
    def s; `#@native.s` end
    def opacity; `#@native.opacity` end
  end

  class <<self
    def color(description)
      color = @d3.JS.color(description)
      if color
        D3::Color.new(color)
      else
        raise ArgumentError, "Invalid color: #{description}"
      end
    end

    def rgb(*args)
      color = if args[0].is_a?(Color)
        @d3.JS.rgb(args[0].native)
      else
        @d3.JS.rgb(*args)
      end
      D3::Color.new(color)
    end

    def hsl(*args)
      color = if args[0].is_a?(Color)
        @d3.JS.hsl(args[0].native)
      else
        @d3.JS.hsl(*args)
      end
      D3::Color.new(color)
    end

    def lab(*args)
      color = if args[0].is_a?(Color)
        @d3.JS.lab(args[0].native)
      else
        @d3.JS.lab(*args)
      end
      D3::Color.new(color)
    end

    def hcl(*args)
      color = if args[0].is_a?(Color)
        @d3.JS.hcl(args[0].native)
      else
        @d3.JS.hcl(*args)
      end
      D3::Color.new(color)
    end

    def cubehelix(*args)
      color = if args[0].is_a?(Color)
        @d3.JS.cubehelix(args[0].native)
      else
        @d3.JS.cubehelix(*args)
      end
      D3::Color.new(color)
    end
  end
end
