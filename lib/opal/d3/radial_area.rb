module D3
  class RadialAreaGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_d3_block :angle
    attribute_d3_block :start_angle, :startAngle
    attribute_d3_block :end_angle, :endAngle
    attribute_d3_block :radius
    attribute_d3_block :inner_radius, :innerRadius
    attribute_d3_block :outer_radius, :outerRadius
    attribute_d3_block :defined

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        D3::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end

    def line_start_angle
      D3::RadialLineGenerator.new @native.JS.lineStartAngle
    end

    def line_end_angle
      D3::RadialLineGenerator.new @native.JS.lineEndAngle
    end

    def line_inner_radius
      D3::RadialLineGenerator.new @native.JS.lineInnerRadius
    end

    def line_outer_radius
      D3::RadialLineGenerator.new @native.JS.lineOuterRadius
    end
  end

  class << self
    def radial_area
      D3::RadialAreaGenerator.new @d3.JS.radialArea
    end
  end
end
