describe "d3 - format" do
  it "d3.format" do
    expect(D3.format(".2").(42)).to eq("42")
    expect(D3.format(".2").(4.2)).to eq("4.2")
    expect(D3.format(".1").(42)).to eq("4e+1")
    expect(D3.format(".1").(4.2)).to eq("4")
  end

  it "d3.format_prefix" do
    f = D3.format_prefix(",.0", 1e-6)
    expect(f.(0.0042)).to eq("4,200µ")
    expect(f.(0.00042)).to eq("420µ")
  end

  it "d3.format_specifier" do
    expect(D3.format_specifier("s")).to be_instance_of(D3::FormatSpecifier)
    expect(D3.format_specifier("s").to_h).to eq({
      fill: " ",
      align: ">",
      sign: "-",
      symbol: "",
      zero: false,
      width: nil,
      comma: false,
      precision: nil,
      type: "s",
    })
    s = D3.format_specifier("f")
    s.precision = D3.precision_fixed(0.01)
    f = D3.format(s)
    expect(f.(42)).to eq("42.00")
  end

  it "d3.precision_fixed" do
    expect(D3.precision_fixed(0.5)).to eq(1)
  end

  it "d3.precision_prefix" do
    expect(D3.precision_prefix(1e5, 1.3e6)).to eq(1)
  end

  it "d3.precision_round" do
    expect(D3.precision_round(0.01, 1.01)).to eq(3)
  end
end
