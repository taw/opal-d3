describe "d3 - quantize scale" do
  let(:color) { D3.scale_quantize.domain([0, 1]).range(["brown", "steelblue"]) }
  let(:width) { D3.scale_quantize.domain([10, 100]).range([1, 2, 4]) }

  it "d3.quantize_scale" do
    expect(D3.scale_quantize).to be_instance_of(D3::QuantizeScale)
  end

  it "basics - color" do
    expect(color.(0.49)).to eq("brown")
    expect(color.(0.51)).to eq("steelblue")
    expect(color.domain).to eq([0,1])
    expect(color.range).to eq(["brown", "steelblue"])
  end

  it "basics - width" do
    expect(width.(20)).to eq(1)
    expect(width.(50)).to eq(2)
    expect(width.(80)).to eq(4)
    expect(width.invert_extent(2)).to eq([40, 70])
  end

  it ".nice / .copy" do
    s = D3.scale_quantize.domain([7, 109]).range([1, 2, 4])
    sc = s.copy
    expect(s.nice().domain).to eq([0, 110])
    expect(sc.domain).to eq([7, 109])
  end

  it ".ticks" do
    expect(width.ticks).to eq([10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
    expect(width.ticks(5)).to eq([20, 40, 60, 80, 100])
  end

  it ".tick_format" do
    expect(width.tick_format.(30)).to eq("30")
    expect(width.tick_format(5).(30)).to eq("30")
    expect(width.tick_format(5, "+%").(30)).to eq("+3000%")
  end
end
