module D3
  class ArcGenerator
    include D3::Native
    def call(*args)
      @native.call(*args)
    end

    attribute_d3_block :inner_radius, :innerRadius
    attribute_d3_block :outer_radius, :outerRadius
    attribute_d3_block :corner_radius, :cornerRadius
    attribute_d3_block :start_angle, :startAngle
    attribute_d3_block :end_angle, :endAngle
    alias_native :centroid
  end

  class << self
    def arc
      D3::ArcGenerator.new @d3.JS.arc
    end
  end
end
