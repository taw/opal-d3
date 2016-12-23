module D3
  class Path
    include D3::Native

    # D3 methods aren't chainable, but there's no reason why they shouldn't be
    alias_native_chainable :move_to, :moveTo
    alias_native_chainable :close_path, :closePath
    alias_native_chainable :line_to, :lineTo
    alias_native_chainable :quadratic_curve_to, :quadraticCurveTo
    alias_native_chainable :bezier_curve_to, :bezierCurveTo
    alias_native_chainable :arc_to, :arcTo
    alias_native_chainable :arc, :arc
    alias_native_chainable :rect, :rect
    alias_native :to_s, :toString
  end

  class << self
    def path
      D3::Path.new @d3.JS.path
    end
  end
end
