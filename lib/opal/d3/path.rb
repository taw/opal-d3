module D3
  class Path
    def initialize
      @native = `window.d3.path()`
    end

    # D3 methods aren't chainable, but there's no reason why they shouldn't be
    def move_to(*args)
      @native.JS.moveTo(*args)
      self
    end

    def close_path(*args)
      @native.JS.closePath(*args)
      self
    end

    def line_to(*args)
      @native.JS.lineTo(*args)
      self
    end

    def quadratic_curve_to(*args)
      @native.JS.quadraticCurveTo(*args)
      self
    end

    def bezier_curve_to(*args)
      @native.JS.bezierCurveTo(*args)
      self
    end

    def arc_to(*args)
      @native.JS.arcTo(*args)
      self
    end

    def arc(*args)
      @native.JS.arc(*args)
      self
    end

    def rect(*args)
      @native.JS.rect(*args)
      self
    end

    def to_s
      @native.JS.toString
    end
  end

  class << self
    def path
      D3::Path.new
    end
  end
end
