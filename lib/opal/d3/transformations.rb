module D3
  class << self
    alias_d3 :merge
    alias_d3 :pairs
    alias_d3 :permute
    alias_d3 :shuffle
    alias_d3 :ticks
    alias_d3 :tick_step, :tickStep
    alias_d3 :range
    alias_d3 :transpose
    alias_d3 :zip
  end
end
