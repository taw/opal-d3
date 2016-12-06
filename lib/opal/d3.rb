require "opal"

class D3
end

def d3
  raise if `window.d3 === undefined`
  `window.d3`
end
