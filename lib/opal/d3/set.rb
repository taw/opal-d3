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
    include Native
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
      D3::Set.new(array, &block)
    end
  end
end
