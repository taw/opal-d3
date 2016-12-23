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

  # This provides ruby style and jquery style interfaces:
  # obj.foo
  # obj.foo = 1; obj.bar = 2
  # obj.foo(1).bar(2)
  def attribute_d3(ruby_name, js_name=ruby_name)
    eval <<-EOF
      def #{ruby_name}(new_value=nil)
        if new_value != nil
          @native.JS.#{js_name}(new_value)
          self
        else
          @native.JS.#{js_name}
        end
      end
      def #{ruby_name}=(new_value)
        @native.JS.#{js_name}(new_value)
      end
    EOF
  end

  def alias_native_chainable(ruby_name, js_name=ruby_name)
    eval <<-EOF
      def #{ruby_name}(*args)
        @native.JS.#{js_name}(*args)
        self
      end
    EOF
  end

  def alias_native_new(ruby_name, js_name=ruby_name)
    eval <<-EOF
      def #{ruby_name}(*args)
        self.class.new @native.JS.#{js_name}(*args)
      end
    EOF
  end
end

module D3
  @d3 = `window.d3`
  class << self
  end
end

require_relative "d3/arc"
require_relative "d3/area"
require_relative "d3/axis"
require_relative "d3/band_scale"
require_relative "d3/collections"
require_relative "d3/color"
require_relative "d3/continuous_scale"
require_relative "d3/curve"
require_relative "d3/ease"
require_relative "d3/format"
require_relative "d3/histograms"
require_relative "d3/interpolate"
require_relative "d3/line"
require_relative "d3/map"
require_relative "d3/misc"
require_relative "d3/nest"
require_relative "d3/ordinal_scale"
require_relative "d3/path"
require_relative "d3/pie"
require_relative "d3/point_scale"
require_relative "d3/polygon"
require_relative "d3/quadtree"
require_relative "d3/quantile_scale"
require_relative "d3/quantize_scale"
require_relative "d3/radial_area"
require_relative "d3/radial_line"
require_relative "d3/random"
require_relative "d3/search"
require_relative "d3/selection"
require_relative "d3/sequential_scale"
require_relative "d3/set"
require_relative "d3/stack"
require_relative "d3/statistics"
require_relative "d3/symbol"
require_relative "d3/threshold_scale"
require_relative "d3/time_format"
require_relative "d3/time_interval"
require_relative "d3/transformations"
