module D3
  class AreaGenerator
    include D3::Native
  end

  class << self
    def area
      D3::AreaGenerator.new @d3.JS.area
    end
  end
end
