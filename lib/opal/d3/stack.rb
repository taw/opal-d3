module D3
  class StackGenerator
    include D3::Native
  end

  class << self
    def stack
      D3::StackGenerator.new @d3.JS.stack
    end
  end
end
