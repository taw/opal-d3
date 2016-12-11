module D3
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

    alias_native :find
  end

  class << self
    def quadtree(*args)
      QuadTree.new @d3.JS.quadtree(*args)
    end
  end
end
