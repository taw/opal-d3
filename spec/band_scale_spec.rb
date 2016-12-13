describe "d3 - band scale" do
  it "d3.scale_band" do
    expect(D3.scale_band).to be_instance_of(D3::BandScale)
  end

  let(:d) { ("a".."f").to_a }
  it "basics" do
    scale = D3.scale_band.domain(d)
    expect(d.map{|v| scale.(v).round(2)}).to eq([0, 0.17, 0.33, 0.5, 0.67, 0.83])
    expect(scale.bandwidth).to eq(0.16666666666666666)
    expect(scale.step).to eq(0.16666666666666666)
    expect(scale.("z")).to eq(nil)
  end

  it "padding" do
    scale = D3.scale_band.domain(d).range([0,100])
    expect(scale.padding).to eq(0)
    expect(scale.padding_inner).to eq(0)
    expect(scale.padding_outer).to eq(0)

    scale.padding(0.5)
    expect(scale.padding).to eq(0.5)
    expect(scale.padding_inner).to eq(0.5)
    expect(scale.padding_outer).to eq(0.5)

    scale.padding_inner(0.2)
    scale.padding_outer(0.4)
    expect(scale.padding).to eq(0.2)
    expect(scale.padding_inner).to eq(0.2)
    expect(scale.padding_outer).to eq(0.4)

    expect(d.map{|v| scale.(v).round(2)}).to eq([6.06, 21.21, 36.36, 51.52, 66.67, 81.82])
    expect(scale.bandwidth).to eq(12.121212121212123)
    expect(scale.step).to eq(15.151515151515152)
  end

  it "copy" do
    scale = D3.scale_band.domain(d)
    sc = scale.copy.range([10,20])
    expect(scale.domain).to eq(d)
    expect(sc.domain).to eq(d)
    expect(scale.range).to eq([0,1])
    expect(sc.range).to eq([10,20])
  end

  it "align" do
    scale = D3.scale_band.domain(d).range([0,100])
    expect(scale.align).to eq(0.5)
    scale.padding_inner(0.2)
    scale.padding_outer(0.4)
    expect(d.map{|v| scale.(v).round(2)}).to eq([6.06, 21.21, 36.36, 51.52, 66.67, 81.82])

    scale.align(0)
    expect(scale.align).to eq(0)
    expect(d.map{|v| scale.(v).round(2)}).to eq([0, 15.15, 30.3, 45.45, 60.61, 75.76])

    scale.align(1)
    expect(scale.align).to eq(1)
    expect(d.map{|v| scale.(v).round(2)}).to eq([12.12, 27.27, 42.42, 57.58, 72.73, 87.88])
    expect(scale.bandwidth).to eq(12.121212121212123)
    expect(scale.step).to eq(15.151515151515152)
  end

  it "round" do
    scale = D3.scale_band.domain(d).range([0,100])
    expect(scale.round).to eq(false)
    scale.range_round([0,1000])
    expect(scale.range).to eq([0,1000])
    expect(scale.round).to eq(true)
    # This rounding is somewhat weird
    expect(d.map{|v| scale.(v)}).to eq([2, 168, 334, 500, 666, 832])
  end
end
