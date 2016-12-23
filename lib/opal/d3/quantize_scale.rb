module D3
  class QuantizeScale
    include D3::Native

    def call(t)
      @native.call(t)
    end

    attribute_d3 :domain
    attribute_d3 :range
    alias_native :invert_extent, :invertExtent
    alias_native :ticks
    alias_native :tick_format, :tickFormat
    alias_native_chainable :nice
    alias_native_new :copy
  end

  class << self
    def scale_quantize
      D3::QuantizeScale.new @d3.JS.scaleQuantize
    end
  end
end
