module D3
  class LineGenerator
    include D3::Native

    def call(*args)
      result = @native.call(*args)
      `result === null ? nil : result`
    end

    attribute_d3_block :x
    attribute_d3_block :y
    attribute_d3_block :defined
  end

  class << self
    def line
      D3::LineGenerator.new @d3.JS.line
    end
  end
end
