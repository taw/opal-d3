module D3
  class Creator
    include D3::Native
  end

  class << self
    def creator(name)
      D3::Creator.new @d3.JS.creator(name)
    end
  end
end
