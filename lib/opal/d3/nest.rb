module D3
  class Nest
    def initialize
      @native = `window.d3`.JS.nest
      @depth = 0
      @rollup = false
    end

    def key(&block)
      @native.JS.key(block)
      @depth += 1
      self
    end

    def sort_keys(key=nil,&block)
      if block
        raise ArgumentError, "Pass block or :ascending/:descending"
      else
        if key == :ascending
          block = `window.d3.ascending`
        elsif key == :descending
          block = `window.d3.descending`
        else
          raise ArgumentError, "Pass block or :ascending/:descending"
        end
      end
      @native.JS.sortKeys(block)
      self
    end

    def sort_values(key=nil,&block)
      if block
        raise ArgumentError, "Pass block or :ascending/:descending"
      else
        if key == :ascending
          block = `window.d3.ascending`
        elsif key == :descending
          block = `window.d3.descending`
        else
          raise ArgumentError, "Pass block or :ascending/:descending"
        end
      end
      @native.JS.sortValues(block)
      self
    end

    # This is really attrocious, why don't we just return nested hash?
    def map(array)
      result = @native.JS.map(array)
      map_map(result, @depth)
    end

    def entries(array)
      result = @native.JS.entries(array)
      map_entries(result, @depth)
    end

    def object(array)
      @native.JS.object(array)
    end

    def rollup(&block)
      @native.JS.rollup(block)
      @rollup = true
      self
    end

    private

    def map_entries(result, depth)
      if depth == 0
        result
      else
        if @rollup and depth == 1
          result.map{|o| [`o.key`, `o.value`]}
        else
          result.map{|o| [`o.key`, map_entries(`o.values`, depth-1)]}
        end
      end
    end

    def map_map(result, depth)
      if depth == 0
        result
      else
        output = D3::Map.new(`window.d3.map()`)
        D3::Map.new(result).each do |vs, k|
          output.set(k, map_map(vs, depth-1))
        end
        output
      end
    end
  end

  class << self
    def nest
      D3::Nest.new
    end
  end
end
