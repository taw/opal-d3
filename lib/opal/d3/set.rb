module D3
  class Set
    include D3::Native
    alias_native :empty?, :empty
    alias_native :has?, :has
    alias_native :size
    alias_native :values
    alias_native_chainable :add
    alias_native_chainable :clear
    alias_native_chainable :remove

    def each(&block)
      @native.JS.each(block)
      self
    end

    def inspect
      "#<D3::Set: {#{ values.join(", ") }}>"
    end
  end

  class << self
    def set(array=nil, &block)
      if block_given?
        D3::Set.new @d3.JS.set(array, proc{|x| yield(x)})
      elsif array
        D3::Set.new @d3.JS.set(array)
      else
        D3::Set.new @d3.JS.set()
      end
    end
  end
end
