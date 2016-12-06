require_relative "map"
require_relative "set"

module D3
  class << self
    alias_d3 :keys
    alias_d3 :values
    alias_d3 :entries

    def map(object=nil, &block)
      D3::Map.new(object, &block)
    end

    def set(array=nil, &block)
      D3::Set.new(array, &block)
    end
  end
end
