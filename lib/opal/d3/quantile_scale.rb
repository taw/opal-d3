module D3
  class QuantileScale
    include D3::Native

    def call(t)
      @native.call(t)
    end

    attribute_d3 :domain
    attribute_d3 :range
    alias_native :invert_extent, :invertExtent
    alias_native :quantiles
    alias_native_new :copy
  end

  class << self
    def scale_quantile
      D3::QuantileScale.new @d3.JS.scaleQuantile
    end
  end
end
