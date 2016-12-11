module D3
  class FormatSpecifier
    def initialize(native)
      raise unless native
      @native = native
    end

    FIELDS = %W[fill align sign symbol zero width comma precision type]
    FIELDS.each do |key|
      define_method(key) {
        `v = #@native[key]`
        `v === undefined ? nil : v`
      }
      define_method("#{key}=") {|v|
        `#@native[key] = (v === nil ? undefined : v)`
      }
    end

    def to_h
      result = {}
      FIELDS.each do |key|
        result[key] = send(key)
      end
      result
    end

    def to_n
      @native
    end
  end

  class << self
    alias_d3 :precision_fixed, :precisionFixed
    alias_d3 :precision_prefix, :precisionPrefix
    alias_d3 :precision_round, :precisionRound
    alias_d3 :format_prefix, :formatPrefix

    def format(specifier)
      if specifier.is_a?(FormatSpecifier)
        @d3.JS.format(specifier.to_n)
      else
        @d3.JS.format(specifier)
      end
    end

    def format_specifier(specifier)
      D3::FormatSpecifier.new @d3.JS.formatSpecifier(specifier)
    end
  end
end
