module D3
  class RadialLineGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_d3_block :angle
    attribute_d3_block :radius
    attribute_d3_block :defined

    def curve(new_value=`undefined`)
      if `new_value === undefined`
        D3::Curve.new @native.JS.curve
      else
        @native.JS.curve(new_value.to_n)
        self
      end
    end
  end

  class << self
    def radial_line
      D3::RadialLineGenerator.new @d3.JS.radialLine
    end
  end
end
