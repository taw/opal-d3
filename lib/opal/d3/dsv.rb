module D3
  class DsvFormat
    include D3::Native

    def parse_rows(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @native.JS.parseRows(string, proc{|d|
          result = row.call(d)
          result == nil ? `null` : result
        })
      else
        @native.JS.parseRows(string)
      end
    end

    def parse(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @native.JS.parse(string, proc{|e|
          result = row.call(`Opal.hash(e)`)
          result == nil ? `null` : result
        })
      else
        @native.JS.parse(string).map{|e| `Opal.hash(e)` }
      end
    end

    alias_native :format_rows, :formatRows
  end

  class << self
    def dsv_format(separator)
      D3::DsvFormat.new @d3.JS.dsvFormat(separator)
    end

    def csv_parse_rows(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @d3.JS.csvParseRows(string, proc{|d|
          result = row.call(d)
          result == nil ? `null` : result
        })
      else
        @d3.JS.csvParseRows(string)
      end
    end

    def tsv_parse_rows(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @d3.JS.tsvParseRows(string, proc{|d|
          result = row.call(d)
          result == nil ? `null` : result
        })
      else
        @d3.JS.tsvParseRows(string)
      end
    end

    def csv_format_rows(rows)
      @d3.JS.csvFormatRows(rows)
    end

    def tsv_format_rows(rows)
      @d3.JS.tsvFormatRows(rows)
    end

    def csv_parse(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @d3.JS.csvParse(string, proc{|e|
          result = row.call(`Opal.hash(e)`)
          result == nil ? `null` : result
        })
      else
        @d3.JS.csvParse(string).map{|e| `Opal.hash(e)` }
      end
    end

    def tsv_parse(string, row=`undefined`, &block)
      row = block if block_given?
      if `row !== undefined`
        @d3.JS.tsvParse(string, proc{|e|
          result = row.call(`Opal.hash(e)`)
          result == nil ? `null` : result
        })
      else
        @d3.JS.tsvParse(string).map{|e| `Opal.hash(e)` }
      end
    end
  end
end
