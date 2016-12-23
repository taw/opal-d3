module D3
  class ArcGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def arc
      D3::ArcGenerator.new @d3.JS.arc
    end
  end
end
