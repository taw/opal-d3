describe "d3 ordinal scale" do
  it "d3.scale_ordinal" do
    expect(D3.scale_ordinal).to be_instance_of(D3::OrdinalScale)
  end

  let(:d) { ("a".."z").to_a }
  let(:r) { D3.scheme_category_10 }
  let(:colors) { D3.scale_ordinal.domain(d).range(r) }

  it "basics" do
    expect(colors.domain).to eq(d)
    expect(colors.range).to eq(r)
    expect(colors.("c")).to eq("#2ca02c")
    expect(colors.("z")).to eq("#8c564b")
    # default implicit
    expect(colors.("X")).to eq("#e377c2")
    expect(colors.("Y")).to eq("#7f7f7f")
    expect(colors.("X")).to eq("#e377c2")
  end

  it "unknown" do
    expect(D3.scale_implicit).to eq(:implicit)
    expect(colors.unknown).to eq(:implicit)

    colors.unknown("#ffffff")
    expect(colors.unknown).to eq("#ffffff")
    expect(colors.("c")).to eq("#2ca02c")
    expect(colors.("C")).to eq("#ffffff")

    colors.unknown(:implicit)
    expect(colors.unknown).to eq(:implicit)
    expect(colors.("c")).to eq("#2ca02c")
    expect(colors.("C")).to eq("#e377c2")
  end

  it "copy" do
    cc = colors.copy.domain([1,2,3])
    expect(colors.domain).to eq(d)
    expect(cc.domain).to eq([1,2,3])
    expect(colors.range).to eq(r)
    expect(cc.range).to eq(r)
  end

  it "d3.scheme_category_10" do
    expect(D3.scheme_category_10).to eq(["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"])
  end
end
