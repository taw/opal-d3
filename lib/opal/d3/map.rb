module D3
  class Map
    def initialize(object=nil)
      if block_given?
        @native = `window.d3`.JS.map(object, proc{|x| yield(x)})
      elsif object
        @native = `window.d3`.JS.map(object)
      else
        @native = `window.d3`.JS.map()
      end
    end

    def has?(key)
      @native.JS.has(key)
    end

    def get(key)
      result = @native.JS.get(key)
      `result === undefined ? nil : result`
    end
    alias_method :[], :get

    def set(key, value)
      @native.JS.set(key, value)
      self
    end
    alias_method :[]=, :set

    def remove(key)
      @native.JS.remove(key)
      self
    end

    def clear
      @native.JS.clear()
      self
    end

    def keys
      @native.JS.keys()
    end

    def values
      @native.JS.values()
    end

    def entries
      @native.JS.entries()
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
      "#<D3::Map: {#{ entries.map{|o|
        "#{o.key} => #{o.value}"
      }.join(", ")}>"
    end
  end
end
