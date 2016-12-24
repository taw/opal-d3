module D3
  class AreaGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_d3_block :x
    attribute_d3_block :x0
    attribute_d3_block :x1
    attribute_d3_block :y
    attribute_d3_block :y0
    attribute_d3_block :y1
    attribute_d3_block :defined

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        D3::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end

    def line_x0
      D3::LineGenerator.new @native.JS.lineX0
    end

    def line_x1
      D3::LineGenerator.new @native.JS.lineX1
    end

    def line_y0
      D3::LineGenerator.new @native.JS.lineY0
    end

    def line_y1
      D3::LineGenerator.new @native.JS.lineY1
    end
  end

  class << self
    def area
      D3::AreaGenerator.new @d3.JS.area
    end
  end
end
