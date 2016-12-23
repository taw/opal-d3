module D3
  class FormatSpecifier
    include D3::Native

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

  class FormatLocale
    include D3::Native

    def format(specifier)
      if specifier.is_a?(FormatSpecifier)
        @native.JS.format(specifier.to_n)
      else
        @native.JS.format(specifier)
      end
    end

    def format_prefix(specifier, value)
      if specifier.is_a?(FormatSpecifier)
        @native.JS.formatPrefix(specifier.to_n, value)
      else
        @native.JS.formatPrefix(specifier, value)
      end
    end
  end


  class << self
    alias_d3 :precision_fixed, :precisionFixed
    alias_d3 :precision_prefix, :precisionPrefix
    alias_d3 :precision_round, :precisionRound

    def format(specifier)
      if specifier.is_a?(FormatSpecifier)
        @d3.JS.format(specifier.to_n)
      else
        @d3.JS.format(specifier)
      end
    end

    def format_prefix(specifier, value)
      if specifier.is_a?(FormatSpecifier)
        @d3.JS.formatPrefix(specifier.to_n, value)
      else
        @d3.JS.formatPrefix(specifier, value)
      end
    end

    def format_specifier(specifier)
      D3::FormatSpecifier.new @d3.JS.formatSpecifier(specifier)
    end

    def format_locale(spec={})
      D3::FormatLocale.new @d3.JS.formatLocale(
        {
          decimal: spec.fetch("decimal", "."),
          thousands: spec.fetch("thousands", ","),
          grouping: spec.fetch("grouping", [3]),
          currency: spec.fetch("currency", ["$", ""]),
        }.to_n
      )
    end

    def format_default_locale(spec={})
      D3::FormatLocale.new @d3.JS.formatDefaultLocale(
        {
          decimal: spec.fetch("decimal", "."),
          thousands: spec.fetch("thousands", ","),
          grouping: spec.fetch("grouping", [3]),
          currency: spec.fetch("currency", ["$", ""]),
        }.to_n
      )
    end
  end
end
