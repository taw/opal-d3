describe "d3 - line" do
  it "d3.line" do
    expect(D3.line).to be_instance_of(D3::LineGenerator)
  end

  let(:simple_data) { [[1,2],[3,5],[4,9]] }
  let(:extended_data) { [[1,2],[3,5],[4,9],[6,10],[7,8]] }

  it "basics" do
    expect(D3.line.(simple_data)).to eq("M1,2L3,5L4,9")
  end

  it "curve" do
    expect(D3.line.curve).to be_instance_of(D3::Curve)
    expect(D3.line.curve(D3.curve_natural).(simple_data)).to eq(%W[
      M1,2
      C1.75,2.9166666666666665,2.5,3.833333333333333,3,5
      C3.5,6.166666666666667,3.75,7.583333333333334,4,9
    ].join)
  end

  it "x/y accessors" do
    line = D3.line
    line.x{|(x,y)| x*10}.y{|(x,y)| y*100}
    expect(line.x.([23,42])).to eq(230)
    expect(line.y.([23,42])).to eq(4200)
    expect(line.(simple_data)).to eq("M10,200L30,500L40,900")
  end

  it ".x constant" do
    line = D3.line.x(10)
    expect(line.(simple_data)).to eq("M10,2L10,5L10,9")
    expect(line.x.(42)).to eq(10)
    line.x = 20
    expect(line.x.(42)).to eq(20)
  end

  it ".y constant" do
    line = D3.line.y(10)
    expect(line.(simple_data)).to eq("M1,10L3,10L4,10")
    expect(line.y.(42)).to eq(10)
    line.y = 20
    expect(line.y.(42)).to eq(20)
  end

  it ".defined" do
    expect(D3.line.defined(false).(simple_data)).to eq(nil)
    expect(D3.line.defined{false}.(simple_data)).to eq(nil)
    expect(D3.line.defined(true).(simple_data)).to eq("M1,2L3,5L4,9")
    expect(D3.line.defined{true}.(simple_data)).to eq("M1,2L3,5L4,9")
    expect(D3.line.(extended_data)).to eq("M1,2L3,5L4,9L6,10L7,8")
    expect(D3.line.defined{|(x,y)| x.odd?}.(extended_data)).to eq("M1,2L3,5M7,8Z")
  end
end

__END__

line.context - set the rendering context.
