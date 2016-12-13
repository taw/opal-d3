describe "d3 - threshold scale" do
  let(:color) { D3.scale_threshold.domain([0, 1]).range(["red", "white", "green"]) }
  it "d3.scale_threshold" do
    expect(D3.scale_threshold).to be_instance_of(D3::ThresholdScale)
  end

  it "basics" do
    expect(color.(-1)).to eq("red")
    expect(color.(0)).to eq("white")
    expect(color.(0.5)).to eq("white")
    expect(color.(1)).to eq("green")
    expect(color.(1000)).to eq("green")
  end

  it "invert_extent" do
    expect(color.invert_extent("red")).to eq([nil, 0])
    expect(color.invert_extent("white")).to eq([0, 1])
    expect(color.invert_extent("green")).to eq([1, nil])
  end

  it "copy" do
    cc = color.copy.domain([0,10])
    expect(cc.domain).to eq([0,10])
    expect(cc.range).to eq(["red", "white", "green"])
    expect(color.domain).to eq([0,1])
    expect(color.range).to eq(["red", "white", "green"])
  end
end
