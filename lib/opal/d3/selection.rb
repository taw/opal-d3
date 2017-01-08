module D3
  class Selection
    include D3::Native
    alias_native :size
    alias_native :empty?, :empty
    alias_native :node
    alias_native :nodes

    def inspect
      `#@native.toString()`
    end

    attribute_d3_block :text
    attribute_d3_block :html

    def data(data=nil,key=nil,&block)
      if block
        self.class.new @native.JS.data(block)
      elsif key != nil
        self.class.new @native.JS.data(data,key)
      elsif data != nil
        self.class.new @native.JS.data(data)
      else
        @native.JS.data
      end
    end

    def append(name=`undefined`, &block)
      raise if `name !== undefined` and block_given?
      name = block if block_given?
      D3::Selection.new @native.JS.append(name.to_n)
    end

    def insert(name=`undefined`, before=`undefined`, &block)
      if `name === undefined`
        raise unless block_given?
        D3::Selection.new @native.JS.insert(block.to_n)
      elsif `before === undefined`
        if block_given?
          D3::Selection.new @native.JS.insert(name.to_n, block.to_n)
        else
          D3::Selection.new @native.JS.insert(name.to_n)
        end
      else
        raise if block_given?
        D3::Selection.new @native.JS.insert(name.to_n, before.to_n)
      end
    end

    alias_native_new :remove
    alias_native_new :select
    alias_native_new :select_all, :selectAll
    alias_native_new :enter
    alias_native_new :exit
    alias_native :call
    alias_native_chainable :raise
    alias_native_chainable :lower

    def merge(other)
      D3::Selection.new @native.JS.merge(other.to_n)
    end

    def classed(classes, yesno=`undefined`, &block)
      if block_given?
        @native.JS.classed(classes, block)
        self
      elsif `yesno !== undefined`
        @native.JS.classed(classes, yesno)
        self
      else
        @native.JS.classed(classes)
      end
    end

    def filter(other=`undefined`,&block)
      if block_given?
        D3::Selection.new @native.JS.filter(block)
      else
        D3::Selection.new @native.JS.filter(other)
      end
    end

    def each(other=`undefined`,&block)
      if block_given?
        @native.JS.each(block)
      else
        @native.JS.each(other)
      end
      self
    end

    def property(key, value=`undefined`)
      if `value === undefined`
        @native.JS.property(key)
      else
        @native.JS.property(key, value)
        self
      end
    end

    # Usage:
    # style("foo")
    # style("foo"){ value }
    # style("foo", value)
    # style("foo", value, priority)
    def style(name, value=`undefined`, priority=`undefined`, &block)
      if block
        raise if `name === undefined` or `priority !== undefined` or `value !== undefined`
        Selection.new @native.JS.style(name, block)
      elsif `value === undefined`
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
