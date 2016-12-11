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
      Quad.new(`#@native.next`)
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
          Quad.new(q)
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
      QuadTree.new @native.JS.copy
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
  end

  class << self
    def quadtree(*args)
      QuadTree.new @d3.JS.quadtree(*args)
    end
  end
end
