module D3
  class DsvFormat
    include D3::Native

    def parse_rows(string, row=`undefined`, &block)
      if block_given?
        @native.JS.parseRows(string, block)
      elsif `row !== undefined`
        @native.JS.parseRows(string, row)
      else
        @native.JS.parseRows(string)
      end
    end
  end

  class << self
    def dsv_format(separator)
      D3::DsvFormat.new @d3.JS.dsvFormat(separator)
    end

    def csv_parse_rows(string, row=`undefined`, &block)
      if block_given?
        @d3.JS.csvParseRows(string, block)
      elsif `row !== undefined`
        @d3.JS.csvParseRows(string, row)
      else
        @d3.JS.csvParseRows(string)
      end
    end

    def tsv_parse_rows(string, row=`undefined`, &block)
      if block_given?
        @d3.JS.tsvParseRows(string, block)
      elsif `row !== undefined`
        @d3.JS.tsvParseRows(string, row)
      else
        @d3.JS.tsvParseRows(string)
      end
    end
  end
end
