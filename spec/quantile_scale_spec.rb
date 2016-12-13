describe "d3 - quantile scale" do
  it "d3.scale_quantile" do
    expect(D3.scale_quantile).to be_instance_of(D3::QuantileScale)
  end

  it "basics" do
    q = D3.scale_quantile.domain([0,10]).range(("a".."f").to_a)
    expect(q.(4)).to eq("c")

    expect(q.domain).to eq([0,10])
    expect(q.range).to eq(("a".."f").to_a)
    expect(q.quantiles).to eq([1.6666666666666665, 3.333333333333333, 5, 6.666666666666666, 8.333333333333334])
    expect(q.invert_extent("e")).to eq([6.666666666666666, 8.333333333333334])
  end

  it "copy" do
    q = D3.scale_quantile.domain([1,5]).range(["x", "y"])
    qc = q.copy.domain([0,20])
    expect(qc.domain).to eq([0,20])
    expect(qc.range).to eq(["x", "y"])
    expect(q.domain).to eq([1,5])
    expect(q.range).to eq(["x", "y"])
  end
end
