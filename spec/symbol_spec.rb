describe "d3 - symbol" do
  let(:path) { symbol.() }
  let(:rounded) { path.gsub(/\d+\.\d+/){$&.to_f.round(2)} }

  it "d3.symbol" do
    expect(D3.symbol).to be_instance_of(D3::SymbolGenerator)
  end

  describe "basics" do
    let(:symbol) { D3.symbol }
    it do
      expect(rounded).to eq("M4.51,0A4.51,4.51,0,1,1,-4.51,0A4.51,4.51,0,1,1,4.51,0")
    end
  end

  describe "static size/type" do
    let(:symbol) { D3.symbol.type(D3.symbol_triangle).size(1000) }
    it do
      expect(rounded).to eq("M0,-27.75L24.03,13.87L-24.03,13.87Z")
    end
  end

  describe "fuctional size/type" do
    let(:symbol) {
      D3.symbol
        .size{|d| d[:size]}
        .type{|d| D3.symbols[d[:type]]}
    }
    let(:path) { symbol.(data) }
    describe do
      let(:data) {{ size: 100, type: 0 }}
      it do
        expect(rounded).to eq("M5.64,0A5.64,5.64,0,1,1,-5.64,0A5.64,5.64,0,1,1,5.64,0")
      end
    end
    describe do
      let(:data) {{ size: 200, type: 0 }}
      it do
        expect(rounded).to eq("M7.98,0A7.98,7.98,0,1,1,-7.98,0A7.98,7.98,0,1,1,7.98,0")
      end
    end
    describe do
      let(:data) {{ size: 100, type: 1 }}
      it do
        expect(rounded).to eq( "M-6.71,-2.24L-2.24,-2.24L-2.24,-6.71L2.24,-6.71L2.24,-2.24L6.71,-2.24L6.71,2.24L2.24,2.24L2.24,6.71L-2.24,6.71L-2.24,2.24L-6.71,2.24Z")
      end
    end
  end

  it "d3.symbols" do
    expect(D3.symbols.size).to eq(7)
    D3.symbols.each do |sym|
      expect(sym).to be_instance_of(D3::SymbolType)
    end
  end

  describe "symbol types" do
    let(:symbol) { D3.symbol.type(symbol_type) }

    describe "d3.symbol_circle" do
      let(:symbol_type) { D3.symbol_circle }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M4.51,0A4.51,4.51,0,1,1,-4.51,0A4.51,4.51,0,1,1,4.51,0")
      end
    end

    describe "d3.symbol_cross" do
      let(:symbol_type) { D3.symbol_cross }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M-5.37,-1.79L-1.79,-1.79L-1.79,-5.37L1.79,-5.37L1.79,-1.79L5.37,-1.79L5.37,1.79L1.79,1.79L1.79,5.37L-1.79,5.37L-1.79,1.79L-5.37,1.79Z")
      end
    end

    describe "d3.symbol_diamond" do
      let(:symbol_type) { D3.symbol_diamond }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M0,-7.44L4.3,0L0,7.44L-4.3,0Z")
      end
    end

    describe "d3.symbol_square" do
      let(:symbol_type) { D3.symbol_square }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M-4,-4h8v8h-8Z")
      end
    end

    describe "d3.symbol_star" do
      let(:symbol_type) { D3.symbol_star }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M0,-7.55L1.7,-2.33L7.18,-2.33L2.74,0.89L4.44,6.11L4.44e-16,2.88L-4.44,6.11L-2.74,0.89L-7.18,-2.33L-1.7,-2.33Z")
      end
    end

    describe "d3.symbol_triangle" do
      let(:symbol_type) { D3.symbol_triangle }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M0,-7.02L6.08,3.51L-6.08,3.51Z")
      end
    end

    describe "d3.symbol_wye" do
      let(:symbol_type) { D3.symbol_wye }
      it do
        expect(symbol_type).to be_instance_of(D3::SymbolType)
        expect(rounded).to eq("M2.16,1.25L2.16,5.56L-2.16,5.56L-2.16,1.25L-5.9,-0.91L-3.74,-4.65L0,-2.49L3.74,-4.65L5.9,-0.91Z")
      end
    end
  end
end

__END__

symbol.context - set the rendering context.
symbolType.draw - draw this symbol to the given context.
