module D3
  class ArcGenerator
    def initialize(native)
      raise unless native
      @native = native
    end

    def call(*args)
      @native.call(*args)
    end

    attribute_d3_block :inner_radius, :innerRadius
    attribute_d3_block :outer_radius, :outerRadius
    attribute_d3_block :start_angle, :startAngle
    attribute_d3_block :end_angle, :endAngle
  end

  class << self
    def arc
      D3::ArcGenerator.new @d3.JS.arc
    end
  end
end
