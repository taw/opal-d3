module D3
  class Map
    def initialize(native)
      raise unless native
      @native = native
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
      @native.JS.entries().map{|o| [`o.key`, `o.value`]}
    end

    def to_h
      `Opal.hash(#{entries})`
    end

    # Should that be reversed to better match ruby and to work with Enumerable?
    # Or just use #to_h if you want ruby interface?
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
      "#<D3::Map: #{ to_h.inspect }>"
    end
  end

  class << self
    def map(object=nil, &block)
      if block_given?
        D3::Map.new(@d3.JS.map(object, proc{|x| yield(x)}))
      elsif object
        D3::Map.new(@d3.JS.map(object))
      else
        D3::Map.new(@d3.JS.map())
      end
    end
  end
end
