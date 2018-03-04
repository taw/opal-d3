module D3
  class PointScale
    include D3::Native

    def call(t)
      v = @native.call(t)
      `v === undefined ? nil : v`
    end
    attribute_d3 :domain
    attribute_d3 :range
    alias_native_new :copy
    alias_native :bandwidth
    alias_native :step
    attribute_d3 :padding
    attribute_d3 :align
    attribute_d3 :round
    # This requires argument, we might redo this not to
    alias_native_chainable :rangeRound
  end

  class << self
    def scale_point
      D3::PointScale.new @d3.JS.scalePoint
    end
  end
end
