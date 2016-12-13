describe "d3 - point scale" do
  it "d3.scale_point" do
    expect(D3.scale_point).to be_instance_of(D3::PointScale)
  end

  let(:d) { ("a".."f").to_a }
  it "basics" do
    scale = D3.scale_point.domain(d)
    expect(d.map{|v| scale.(v).round(2)}).to eq([0, 0.2, 0.4, 0.6, 0.8, 1])
    expect(scale.bandwidth).to eq(0)
    expect(scale.step).to eq(0.2)
    expect(scale.("z")).to eq(nil)
  end

  it "copy" do
    scale = D3.scale_point.domain(d)
    sc = scale.copy.range([10,20])
    expect(scale.domain).to eq(d)
    expect(sc.domain).to eq(d)
    expect(scale.range).to eq([0,1])
    expect(sc.range).to eq([10,20])
  end

  it "padding" do
    scale = D3.scale_point.domain(d).range([0,100])
    expect(scale.padding).to eq(0)

    scale.padding(0.5)
    expect(scale.padding).to eq(0.5)
    expect(d.map{|v| scale.(v).round(2)}).to eq([8.33, 25, 41.67, 58.33, 75, 91.67])
  end

  it "align" do
    scale = D3.scale_point.domain(d).range([0,100])
    scale.padding(0.5)

    expect(scale.align).to eq(0.5)
    expect(d.map{|v| scale.(v).round(2)}).to eq([8.33, 25, 41.67, 58.33, 75, 91.67])

    scale.align(0)
    expect(scale.align).to eq(0)
    expect(d.map{|v| scale.(v).round(2)}).to eq([0, 16.67, 33.33, 50, 66.67, 83.33])

    scale.align(1)
    expect(scale.align).to eq(1)
    expect(d.map{|v| scale.(v).round(2)}).to eq([16.67, 33.33, 50, 66.67, 83.33, 100])
  end

  it "round" do
    scale = D3.scale_point.domain(d).range([0,100])
    expect(scale.round).to eq(false)
    scale.range_round([0,1000]).padding(1)
    expect(scale.range).to eq([0,1000])
    expect(scale.round).to eq(true)
    # This rounding is somewhat weird
    expect(d.map{|v| scale.(v)}).to eq([145, 287, 429, 571, 713, 855])
  end
end
