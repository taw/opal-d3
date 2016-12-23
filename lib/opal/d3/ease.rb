module D3
  class EasePoly
    include D3::Native
    alias_native_new :exponent

    def call(t)
      @native.call(t)
    end
  end

  class EaseBack
    include D3::Native
    alias_native_new :overshoot

    def call(t)
      @native.call(t)
    end
  end

  class EaseElastic
    include D3::Native
    alias_native_new :amplitude
    alias_native_new :period

    def call(t)
      @native.call(t)
    end
  end

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

    def ease_poly_in(t=nil)
      if t
        @d3.JS.easePolyIn(t)
      else
        D3::EasePoly.new `#@d3.easePolyIn`
      end
    end

    def ease_poly_out(t=nil)
      if t
        @d3.JS.easePolyOut(t)
      else
        D3::EasePoly.new `#@d3.easePolyOut`
      end
    end

    def ease_poly_in_out(t=nil)
      if t
        @d3.JS.easePolyInOut(t)
      else
        D3::EasePoly.new `#@d3.easePolyInOut`
      end
    end

    def ease_back(t=nil)
      if t
        @d3.JS.easeBack(t)
      else
        D3::EaseBack.new `#@d3.easeBack`
      end
    end

    def ease_back_in(t=nil)
      if t
        @d3.JS.easeBackIn(t)
      else
        D3::EaseBack.new `#@d3.easeBackIn`
      end
    end

    def ease_back_out(t=nil)
      if t
        @d3.JS.easeBackOut(t)
      else
        D3::EaseBack.new `#@d3.easeBackOut`
      end
    end

    def ease_back_in_out(t=nil)
      if t
        @d3.JS.easeBackInOut(t)
      else
        D3::EaseBack.new `#@d3.easeBackInOut`
      end
    end

    def ease_elastic(t=nil)
      if t
        @d3.JS.easeElastic(t)
      else
        D3::EaseElastic.new `#@d3.easeElastic`
      end
    end

    def ease_elastic_in(t=nil)
      if t
        @d3.JS.easeElasticIn(t)
      else
        D3::EaseElastic.new `#@d3.easeElasticIn`
      end
    end

    def ease_elastic_out(t=nil)
      if t
        @d3.JS.easeElasticOut(t)
      else
        D3::EaseElastic.new `#@d3.easeElasticOut`
      end
    end

    def ease_elastic_in_out(t=nil)
      if t
        @d3.JS.easeElasticInOut(t)
      else
        D3::EaseElastic.new `#@d3.easeElasticInOut`
      end
    end
  end
end
