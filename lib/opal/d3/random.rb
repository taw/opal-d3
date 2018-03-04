module D3
  class << self
    # These return functions,
    # which doesn't feel very Ruby
    alias_d3 :randomUniform
    alias_d3 :randomNormal
    alias_d3 :randomLogNormal
    alias_d3 :randomBates
    alias_d3 :randomIrwinHall
    alias_d3 :randomExponential
  end
end
