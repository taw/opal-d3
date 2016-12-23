module D3
  class Axis
    include D3::Native
    attribute_d3 :scale
    attribute_d3 :tick_size_inner, :tickSizeInner
    attribute_d3 :tick_size_outer, :tickSizeOuter
    attribute_d3 :tick_size, :tickSize
    attribute_d3 :tick_padding, :tickPadding
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
