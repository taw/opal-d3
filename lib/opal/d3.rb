require "opal"
require "opal-parser"
require "native"

class Module
  def alias_d3(ruby_name, js_name=ruby_name)
    eval <<-EOF
      def #{ruby_name}(*args)
        @d3.JS.#{js_name}(*args)
      end
    EOF
  end
end

module D3
  @d3 = `window.d3`
  class << self
  end
end

require_relative "d3/axis"
require_relative "d3/collections"
require_relative "d3/color"
require_relative "d3/continuous_scale"
require_relative "d3/ease"
require_relative "d3/format"
require_relative "d3/histograms"
require_relative "d3/interpolate"
require_relative "d3/misc"
require_relative "d3/ordinal_scale"
require_relative "d3/path"
require_relative "d3/polygon"
require_relative "d3/quadtree"
require_relative "d3/quantize_scale"
require_relative "d3/random"
require_relative "d3/search"
require_relative "d3/selection"
require_relative "d3/sequential_scale"
require_relative "d3/statistics"
require_relative "d3/time_format"
require_relative "d3/time_interval"
require_relative "d3/transformations"
