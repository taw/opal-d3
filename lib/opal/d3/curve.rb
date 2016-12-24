module D3
  class Curve
    include D3::Native
  end

  class CurveBundle < Curve
    alias_native_new :beta
  end

  class CurveCardinal < Curve
    alias_native_new :tension
  end

  class CurveCatmullRom < Curve
    alias_native_new :alpha
  end

  class << self
    def curve_basis
      D3::Curve.new `window.d3.curveBasis`
    end
    def curve_basis_closed
      D3::Curve.new `window.d3.curveBasisClosed`
    end
    def curve_basis_open
      D3::Curve.new `window.d3.curveBasisOpen`
    end
    def curve_bundle
      D3::CurveBundle.new `window.d3.curveBundle`
    end
    def curve_cardinal
      D3::CurveCardinal.new `window.d3.curveCardinal`
    end
    def curve_cardinal_closed
      D3::CurveCardinal.new `window.d3.curveCardinalClosed`
    end
    def curve_cardinal_open
      D3::CurveCardinal.new `window.d3.curveCardinalOpen`
    end
    def curve_catmull_rom
      D3::CurveCatmullRom.new `window.d3.curveCatmullRom`
    end
    def curve_catmull_rom_closed
      D3::CurveCatmullRom.new `window.d3.curveCatmullRomClosed`
    end
    def curve_catmull_rom_open
      D3::CurveCatmullRom.new `window.d3.curveCatmullRomOpen`
    end
    def curve_linear
      D3::Curve.new `window.d3.curveLinear`
    end
    def curve_linear_closed
      D3::Curve.new `window.d3.curveLinearClosed`
    end
    def curve_monotone_x
      D3::Curve.new `window.d3.curveMonotoneX`
    end
    def curve_monotone_y
      D3::Curve.new `window.d3.curveMonotoneY`
    end
    def curve_natural
      D3::Curve.new `window.d3.curveNatural`
    end
    def curve_step
      D3::Curve.new `window.d3.curveStep`
    end
    def curve_step_after
      D3::Curve.new `window.d3.curveStepAfter`
    end
    def curve_step_before
      D3::Curve.new `window.d3.curveStepBefore`
    end
  end
end
