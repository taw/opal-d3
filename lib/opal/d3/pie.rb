module D3
  class PieGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def pie
      D3::PieGenerator.new @d3.JS.pie
    end
  end
end
