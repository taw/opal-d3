module D3
  class BandScale
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
    # this is really weirdo one, as it sets both paddings* but returns inner one
    # All need to be in [0,1] range
    attribute_d3 :padding
    attribute_d3 :paddingInner
    attribute_d3 :paddingOuter
    attribute_d3 :align
    attribute_d3 :round
    # This requires argument, we might redo this not to
    alias_native_chainable :rangeRound
  end

  class << self
    def scale_band(*args)
      D3::BandScale.new @d3.JS.scaleBand(*args)
    end
  end
end
