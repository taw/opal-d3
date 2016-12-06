require "opal"
require "opal-parser"

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

require_relative "d3/statistics"
require_relative "d3/transformations"
require_relative "d3/histograms"
