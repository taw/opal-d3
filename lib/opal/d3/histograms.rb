module D3
  class << self
    def threshold_freedman_diaconis(*args)
      `window.d3`.JS.thresholdFreedmanDiaconis(*args)
    end

    def threshold_scott(*args)
      `window.d3`.JS.thresholdScott(*args)
    end

    def threshold_sturges(*args)
      `window.d3`.JS.thresholdSturges(*args)
    end
  end
end
