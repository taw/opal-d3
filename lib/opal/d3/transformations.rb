module D3
  class << self
    def merge(arrays)
      `window.d3`.JS.merge(arrays)
    end

    def pairs(array)
      `window.d3`.JS.pairs(array)
    end

    def permute(array, indexes)
      `window.d3`.JS.permute(array, indexes)
    end

    def shuffle(*args)
      `window.d3`.JS.shuffle(*args)
    end

    def ticks(start, stop, count)
      `window.d3`.JS.ticks(start, stop, count)
    end

    def tick_step(start, stop, count)
      `window.d3`.JS.tickStep(start, stop, count)
    end

    def range(*args)
      `window.d3`.JS.range(*args)
    end

    def transpose(array)
      `window.d3`.JS.transpose(array)
    end

    def zip(*arrays)
      `window.d3`.JS.zip(*arrays)
    end
  end
end
