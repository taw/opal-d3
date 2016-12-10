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

    alias_native :text
    def text=(value)
      @native.JS.text(value)
    end

    alias_native :html
    def html=(value)
      @native.JS.html(value)
    end

    def append(type)
      Selection.new @native.JS.append(type)
    end

    def select(selector)
      Selection.new @native.JS.select(selector)
    end

    def select_all(selector)
      Selection.new @native.JS.selectAll(selector)
    end

    def style(name, value=`undefined`, priority=`undefined`)
      if `value === undefined`
        @native.JS.style(name)
      else
        value = `value === nil ? null : value`
        Selection.new @native.JS.style(name, value, priority)
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
