module D3
  class Set
    def initialize(array=nil)
      if block_given?
        @native = `window.d3`.JS.set(array, proc{|x| yield(x)})
      elsif array
        @native = `window.d3`.JS.set(array)
      else
        @native = `window.d3`.JS.set()
      end
    end

    def has?(item)
      @native.JS.has(item)
    end

    def add(item)
      @native.JS.add(item)
      self
    end

    def remove(item)
      @native.JS.remove(item)
      self
    end

    def clear
      @native.JS.clear()
      self
    end

    def values
      @native.JS.values()
    end

    def each(&block)
      @native.JS.each(block)
      self
    end

    def empty?
      @native.JS.empty()
    end

    def size
      @native.JS.size
    end

    def inspect
      "#<D3::Set: {#{ values.join(", ") }}>"
    end
  end
end
