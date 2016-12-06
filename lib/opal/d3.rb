require "opal"

class D3
  class << self
    def min(data, &block)
      if block
        `window.d3`.JS.min(data, proc{|x| yield(x)})
      else
        `window.d3`.JS.min(data)
      end
    end

    def max(data, &block)
      if block
        `window.d3`.JS.max(data, proc{|x| yield(x)})
      else
        `window.d3`.JS.max(data)
      end
    end
  end
end
