module D3
  class ArcGenerator
    include D3::Native
    def call(*args)
      @native.call(*args)
    end

    attribute_d3_block :innerRadius
    attribute_d3_block :outerRadius
    attribute_d3_block :cornerRadius
    attribute_d3_block :startAngle
    attribute_d3_block :endAngle
    alias_native :centroid
  end

  class << self
    def arc
      D3::ArcGenerator.new @d3.JS.arc
    end
  end
end
