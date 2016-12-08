module D3
  class << self
    # These return functions,
    # which doesn't feel very Ruby
    alias_d3 :random_uniform, :randomUniform
    alias_d3 :random_normal, :randomNormal
    alias_d3 :random_log_normal, :randomLogNormal
    alias_d3 :random_bates, :randomBates
    alias_d3 :random_irwin_hall, :randomIrwinHall
    alias_d3 :random_exponential, :randomExponential
  end
end
