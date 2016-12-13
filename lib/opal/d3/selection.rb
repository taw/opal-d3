module D3
  class Selection
    def initialize(native)
      raise unless native
      @native = native
    end

    include Native
    alias_native :size
    alias_native :empty?, :empty
    alias_native :node
    alias_native :nodes

    def inspect
      `#@native.toString()`
    end

    attribute_d3 :text
    attribute_d3 :html
    alias_native_new :append
    alias_native_new :select
    alias_native_new :select_all, :selectAll

    def style(name, value=`undefined`, priority=`undefined`)
      if `value === undefined`
        @native.JS.style(name)
      else
        value = `value === nil ? null : value`
        Selection.new @native.JS.style(name, value, priority)
      end
    end

    # nil means something specific (reset value),
    # so we need another special value
    def attr(name, value=`undefined`, &block)
      if block
        @native.JS.attr(name, block)
        self
      elsif `value == undefined`
        @native.JS.attr(name)
      elsif value == nil
        @native.JS.attr(name, `null`)
        self
      else
        @native.JS.attr(name, value)
        self
      end
    end
  end

  class << self
    def selection
      D3::Selection.new(@d3.JS.selection)
    end

    def select(selector)
      D3::Selection.new(@d3.JS.select(selector))
    end

    def select_all(selector)
      D3::Selection.new(@d3.JS.selectAll(selector))
    end
  end
end
