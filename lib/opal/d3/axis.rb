module D3
  class Axis
    def initialize(native)
      raise unless native
      @native = native
    end

    def scale(new_value=nil)
      if new_value
        @native.JS.scale(new_value)
        self
      else
        @native.JS.scale
      end
    end

    def tick_size_inner(new_value=nil)
      if new_value
        @native.JS.tickSizeInner(new_value)
        self
      else
        @native.JS.tickSizeInner
      end
    end

    def tick_size_outer(new_value=nil)
      if new_value
        @native.JS.tickSizeOuter(new_value)
        self
      else
        @native.JS.tickSizeOuter
      end
    end

    def tick_size(new_value=nil)
      if new_value
        @native.JS.tickSize(new_value)
        self
      else
        @native.JS.tickSize
      end
    end

    def tick_padding(new_value=nil)
      if new_value
        @native.JS.tickPadding(new_value)
        self
      else
        @native.JS.tickPadding
      end
    end
  end

  class << self
    def axis_top(scale)
      D3::Axis.new @d3.JS.axisTop(scale)
    end

    def axis_bottom(scale)
      D3::Axis.new @d3.JS.axisBottom(scale)
    end

    def axis_right(scale)
      D3::Axis.new @d3.JS.axisRight(scale)
    end

    def axis_left(scale)
      D3::Axis.new @d3.JS.axisLeft(scale)
    end
  end
end
