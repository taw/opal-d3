module D3
  class Quad
    def initialize(native)
      raise unless native
      @native = native
    end

    def internal?
      `#@native.constructor === Array`
    end

    def leaf?
      `#@native.constructor !== Array`
    end

    def next
      return nil if internal?
      return nil if `#@native.next == undefined`
      D3::Quad.new(`#@native.next`)
    end

    def data
      return nil if internal?
      `#@native.data`
    end

    def children
      return nil if leaf?
      result = (0..3).map do |i|
        q = `#@native[i]`
        if `q == null`
          nil
        else
          D3::Quad.new(q)
        end
      end
    end
  end

  class QuadTree
    def initialize(native)
      raise unless native
      @native = native
    end

    include Native
    alias_native :size
    alias_native :data

    def add(datum)
      @native.JS.add(datum)
      self
    end

    def add_all(data)
      @native.JS.addAll(data)
      self
    end

    def remove(datum)
      @native.JS.remove(datum)
      self
    end

    def remove_all(data)
      @native.JS.removeAll(data)
      self
    end

    def copy
      D3::QuadTree.new @native.JS.copy
    end

    # visit/visitAfter functions have stupid JS habit of using non-nil return as control
    # and that messes up with languages which have automatic return
    # Maybe worth rewriting to require explicit StopIteration ?
    def visit
      @native.JS.visit(proc do |node, x0, y0, x1, y1|
        yield(D3::Quad.new(node), x0, y0, x1, y1)
      end)
      self
    end

    def visit_after
      @native.JS.visitAfter(proc do |node, x0, y0, x1, y1|
        yield(D3::Quad.new(node), x0, y0, x1, y1)
      end)
      self
    end

    alias_native :find

    def extent(extent=nil)
      if extent
        @native.JS.extent(extent)
        self
      else
        @native.JS.extent
      end
    end

    def cover(x,y)
      @native.JS.cover(x,y)
      self
    end

    def root
      D3::Quad.new @native.JS.root
    end

    def x(&block)
      if block_given?
        @native.JS.x(block)
        self
      else
        @native.JS.x
      end
    end

    def y(&block)
      if block_given?
        @native.JS.y(block)
        self
      else
        @native.JS.y
      end
    end
  end

  class << self
    def quadtree(*args)
      D3::QuadTree.new @d3.JS.quadtree(*args)
    end
  end
end
