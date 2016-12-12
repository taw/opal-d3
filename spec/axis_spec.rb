describe "d3 - axis" do
  let(:scale) { D3.scale_linear.domain([0,80_000_000]).range([0,800]) }
  let(:scale2) { D3.scale_linear.domain([0,30]).range([0,600]) }
  let(:axis) { D3.axis_top(scale) }

  it "d3.axis_top" do
    expect(D3.axis_top(scale)).to be_instance_of(D3::Axis)
  end

  it "d3.axis_bottom" do
    expect(D3.axis_bottom(scale)).to be_instance_of(D3::Axis)
  end

  it "d3.axis_right" do
    expect(D3.axis_right(scale)).to be_instance_of(D3::Axis)
  end

  it "d3.axis_left" do
    expect(D3.axis_left(scale)).to be_instance_of(D3::Axis)
  end

  it "axis.scale" do
    expect(axis.scale).to eq(scale)
    axis.scale(scale2)
    expect(axis.scale).to eq(scale2)
  end

  it "axis.tick_size_inner" do
    expect(axis.tick_size_inner).to eq(6)
    axis.tick_size_inner(20)
    expect(axis.tick_size_inner).to eq(20)
  end

  it "axis.tick_size_outer" do
    expect(axis.tick_size_outer).to eq(6)
    axis.tick_size_outer(20)
    expect(axis.tick_size_outer).to eq(20)
  end

  it "axis.tick_size" do
    expect(axis.tick_size).to eq(6)
    axis.tick_size(20)
    expect(axis.tick_size).to eq(20)
  end

  it "axis.tick_padding" do
    expect(axis.tick_padding).to eq(3)
    axis.tick_padding(10)
    expect(axis.tick_padding).to eq(10)
  end
end
