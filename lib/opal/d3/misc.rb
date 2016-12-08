module D3
  class << self
    def version
      `window.d3.version`
    end

    def namespaces
      `Opal.hash(window.d3.namespaces)`
    end

    def namespace(name)
      `Opal.hash(window.d3.namespace(name))`
    end
  end
end
