module D3
  class << self
    def min(data, &block)
      if block
        @d3.JS.min(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.min(data.compact)
      end
    end

    def max(data, &block)
      if block
        @d3.JS.max(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.max(data.compact)
      end
    end

    def sum(data, &block)
      if block
        @d3.JS.sum(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.sum(data.compact)
      end
    end

    def mean(data, &block)
      result = if block
        @d3.JS.mean(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.mean(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def median(data, &block)
      result = if block
        @d3.JS.median(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.median(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def deviation(data, &block)
      result = if block
        @d3.JS.deviation(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.deviation(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def variance(data, &block)
      result = if block
        @d3.JS.variance(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.variance(data.compact)
      end
      `result === undefined ? nil : result`
    end

    def quantile(data, p, &block)
      result = if block
        @d3.JS.quantile(data, p, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.quantile(data.compact, p)
      end
      `result === undefined ? nil : result`
    end

    def extent(data, &block)
      (a,b) = if block
        @d3.JS.extent(data, proc{|x| y=yield(x); y.nil? ? `undefined` : y})
      else
        @d3.JS.extent(data.compact)
      end
      [`a === undefined ? nil : a`, `b === undefined ? nil : b`]
    end
  end
end
