module D3
  class << self
    def csv(url, &callback)
      if callback
        @d3.JS.csv(url, callback)
      else
        @d3.JS.csv(url)
      end
    end

    def html(url, &callback)
      if callback
        @d3.JS.html(url, callback)
      else
        @d3.JS.html(url)
      end
    end

    def json(url, &callback)
      if callback
        @d3.JS.json(url, callback)
      else
        @d3.JS.json(url)
      end
    end

    def text(url, &callback)
      if callback
        @d3.JS.text(url, callback)
      else
        @d3.JS.text(url)
      end
    end

    def tsv(url, &callback)
      if callback
        @d3.JS.tsv(url, callback)
      else
        @d3.JS.tsv(url)
      end
    end

    def xml(url, &callback)
      if callback
        @d3.JS.xml(url, callback)
      else
        @d3.JS.xml(url)
      end
    end
  end
end
