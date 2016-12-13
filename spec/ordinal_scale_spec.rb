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

  it "d3.scheme_category_20" do
    expect(D3.scheme_category_20).to eq(["#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c", "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5"])
  end

  it "d3.scheme_category_20b" do
    expect(D3.scheme_category_20b).to eq(["#393b79", "#5254a3", "#6b6ecf", "#9c9ede", "#637939", "#8ca252", "#b5cf6b", "#cedb9c", "#8c6d31", "#bd9e39", "#e7ba52", "#e7cb94", "#843c39", "#ad494a", "#d6616b", "#e7969c", "#7b4173", "#a55194", "#ce6dbd", "#de9ed6"])
  end

  it "d3.scheme_category_20c" do
    expect(D3.scheme_category_20c).to eq(["#3182bd", "#6baed6", "#9ecae1", "#c6dbef", "#e6550d", "#fd8d3c", "#fdae6b", "#fdd0a2", "#31a354", "#74c476", "#a1d99b", "#c7e9c0", "#756bb1", "#9e9ac8", "#bcbddc", "#dadaeb", "#636363", "#969696", "#bdbdbd", "#d9d9d9"])
  end
end
