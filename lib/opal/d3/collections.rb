module D3
  class << self
    alias_d3 :keys
    alias_d3 :values

    def entries(obj)
      @d3.JS.entries(obj).map{|o| [`o.key`, `o.value`]}
    end
  end
end
