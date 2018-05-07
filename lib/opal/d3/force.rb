module D3
  class ForceSimulation
    include D3::Native

    # Nodes must be native JS objects
    attribute_d3 :nodes

    def force(name, value=`undefined`)
      if `value === undefined`
        D3::Force.new @native.JS.force(name)
      else
        @native.JS.force(name, value.to_n)
        self
      end
    end

    def on(name, &callback)
      if callback
        @native.JS.on(name, callback)
        self
      else
        @native.JS.on(name)
      end
    end
  end

  # Due to API structure, just share that
  class Force
    include D3::Native

    attribute_d3_block :id
    attribute_d3_block :strength
    attribute_d3_block :distance
    attribute_d3 :links # Must be native objects
    attribute_d3 :x
    attribute_d3 :y
  end

  class << self
    def force_simulation
      D3::ForceSimulation.new @d3.JS.forceSimulation
    end

    def force_link(*args)
      D3::Force.new @d3.JS.forceLink(*args)
    end

    def force_many_body(*args)
      D3::Force.new @d3.JS.forceManyBody(*args)
    end

    def force_center(*args)
      D3::Force.new @d3.JS.forceCenter(*args)
    end
  end
end
