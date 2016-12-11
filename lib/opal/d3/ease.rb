module D3
  class <<self
    def ease_linear(t=nil)
      if t
        @d3.JS.easeLinear(t)
      else
        `#@d3.easeLinear`
      end
    end

    def ease_quad(t=nil)
      if t
        @d3.JS.easeQuad(t)
      else
        `#@d3.easeQuad`
      end
    end

    def ease_quad_in(t=nil)
      if t
        @d3.JS.easeQuadIn(t)
      else
        `#@d3.easeQuadIn`
      end
    end

    def ease_quad_out(t=nil)
      if t
        @d3.JS.easeQuadOut(t)
      else
        `#@d3.easeQuadOut`
      end
    end

    def ease_quad_in_out(t=nil)
      if t
        @d3.JS.easeQuadInOut(t)
      else
        `#@d3.easeQuadInOut`
      end
    end

    def ease_cubic(t=nil)
      if t
        @d3.JS.easeCubic(t)
      else
        `#@d3.easeCubic`
      end
    end

    def ease_cubic_in(t=nil)
      if t
        @d3.JS.easeCubicIn(t)
      else
        `#@d3.easeCubicIn`
      end
    end

    def ease_cubic_out(t=nil)
      if t
        @d3.JS.easeCubicOut(t)
      else
        `#@d3.easeCubicOut`
      end
    end

    def ease_cubic_in_out(t=nil)
      if t
        @d3.JS.easeCubicInOut(t)
      else
        `#@d3.easeCubicInOut`
      end
    end

    def ease_sin(t=nil)
      if t
        @d3.JS.easeSin(t)
      else
        `#@d3.easeSin`
      end
    end

    def ease_sin_in(t=nil)
      if t
        @d3.JS.easeSinIn(t)
      else
        `#@d3.easeSinIn`
      end
    end

    def ease_sin_out(t=nil)
      if t
        @d3.JS.easeSinOut(t)
      else
        `#@d3.easeSinOut`
      end
    end

    def ease_sin_in_out(t=nil)
      if t
        @d3.JS.easeSinInOut(t)
      else
        `#@d3.easeSinInOut`
      end
    end

    def ease_exp(t=nil)
      if t
        @d3.JS.easeExp(t)
      else
        `#@d3.easeExp`
      end
    end

    def ease_exp_in(t=nil)
      if t
        @d3.JS.easeExpIn(t)
      else
        `#@d3.easeExpIn`
      end
    end

    def ease_exp_out(t=nil)
      if t
        @d3.JS.easeExpOut(t)
      else
        `#@d3.easeExpOut`
      end
    end

    def ease_exp_in_out(t=nil)
      if t
        @d3.JS.easeExpInOut(t)
      else
        `#@d3.easeExpInOut`
      end
    end

    def ease_circle(t=nil)
      if t
        @d3.JS.easeCircle(t)
      else
        `#@d3.easeCircle`
      end
    end

    def ease_circle_in(t=nil)
      if t
        @d3.JS.easeCircleIn(t)
      else
        `#@d3.easeCircleIn`
      end
    end

    def ease_circle_out(t=nil)
      if t
        @d3.JS.easeCircleOut(t)
      else
        `#@d3.easeCircleOut`
      end
    end

    def ease_circle_in_out(t=nil)
      if t
        @d3.JS.easeCircleInOut(t)
      else
        `#@d3.easeCircleInOut`
      end
    end

    def ease_bounce(t=nil)
      if t
        @d3.JS.easeBounce(t)
      else
        `#@d3.easeBounce`
      end
    end

    def ease_bounce_in(t=nil)
      if t
        @d3.JS.easeBounceIn(t)
      else
        `#@d3.easeBounceIn`
      end
    end

    def ease_bounce_out(t=nil)
      if t
        @d3.JS.easeBounceOut(t)
      else
        `#@d3.easeBounceOut`
      end
    end

    def ease_bounce_in_out(t=nil)
      if t
        @d3.JS.easeBounceInOut(t)
      else
        `#@d3.easeBounceInOut`
      end
    end
  end
end
