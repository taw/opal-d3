module D3
  class << self
    def interpolate_number(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateNumber`
      else
        @d3.JS.interpolateNumber(a,b)
      end
    end

    def interpolate_round(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateRound`
      else
        @d3.JS.interpolateRound(a,b)
      end
    end

    def interpolate_string(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateString`
      else
        @d3.JS.interpolateString(a,b)
      end
    end

    def interpolate_array(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateArray`
      else
        @d3.JS.interpolateArray(a,b)
      end
    end

    def interpolate_date(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateDate`
      else
        @d3.JS.interpolateDate(a,b)
      end
    end

    # These should support gamma
    def interpolate_rgb(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateRgb`
      else
        @d3.JS.interpolateRgb(a,b)
      end
    end

    def interpolate_rgb_basis(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateRgbBasis`
      else
        @d3.JS.interpolateRgbBasis(a,b)
      end
    end

    def interpolate_rgb_basis_closed(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateRgbBasisClosed`
      else
        @d3.JS.interpolateRgbBasisClosed(a,b)
      end
    end

    def interpolate_hsl(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateHsl`
      else
        @d3.JS.interpolateHsl(a,b)
      end
    end

    def interpolate_hsl_long(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateHslLong`
      else
        @d3.JS.interpolateHslLong(a,b)
      end
    end

    def interpolate_lab(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateLab`
      else
        @d3.JS.interpolateLab(a,b)
      end
    end

    def interpolate_hcl(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateHcl`
      else
        @d3.JS.interpolateHcl(a,b)
      end
    end

    def interpolate_hcl_long(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateHclLong`
      else
        @d3.JS.interpolateHclLong(a,b)
      end
    end

    def interpolate_cubehelix(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateCubehelix`
      else
        @d3.JS.interpolateCubehelix(a,b)
      end
    end

    def interpolate_cubehelix_long(a=nil,b=nil)
      if a == nil and b == nil
        `#@d3.interpolateCubehelixLong`
      else
        @d3.JS.interpolateCubehelixLong(a,b)
      end
    end

  end
end
