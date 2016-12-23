module D3
  class PieGenerator
    include D3::Native
  end

  class << self
    def pie
      D3::PieGenerator.new @d3.JS.pie
    end
  end
end
