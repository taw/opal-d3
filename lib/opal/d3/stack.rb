module D3
  class StackGenerator
    def initialize(native)
      raise unless native
      @native = native
    end
  end

  class << self
    def stack
      D3::StackGenerator.new @d3.JS.stack
    end
  end
end
