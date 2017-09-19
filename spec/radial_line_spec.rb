describe "d3 - radial line" do
  it "d3.radial_line" do
    expect(D3.radial_line).to be_instance_of(D3::RadialLineGenerator)
  end

  let(:simple_data) { [[0,2],[Math::PI*0.10,5],[Math::PI*0.20,3]] }

  it "basics" do
    expect(D3.radial_line.(simple_data)).to eq("M0,-2L1.545084971874737,-4.755282581475767L1.7633557568774194,-2.4270509831248424")
  end

  it "curve" do
    expect(D3.radial_line.curve).to be_instance_of(D3::Curve)
    expect(D3.radial_line.curve(D3.curve_natural).(simple_data)).to eq(%W[
      M0,-2
      C0.6255961728642502,-3.3420537088108135,1.2511923457285004,-4.684107417621627,1.545084971874737,-4.755282581475767
      C1.8389775980209737,-4.826457745329908,1.8011666774491966,-3.626754364227375,1.7633557568774194,-2.4270509831248424
    ].join)
  end

  it "angle/radius accessors" do
    radial_line = D3.radial_line
    radial_line.angle{|(a,r)| a*2}.radius{|(a,r)| r*100}
    expect(radial_line.angle.([2,42])).to eq(4)
    expect(radial_line.radius.([2,42])).to eq(4200)
    expect(radial_line.(simple_data)).to eq("M0,-200L293.8926261462366,-404.5084971874737L285.31695488854604,-92.70509831248424")
  end

  it ".angle constant" do
    radial_line = D3.radial_line.angle(Math::PI)
    expect(radial_line.(simple_data)).to eq("M2.4492935982947064e-16,2L6.123233995736766e-16,5L3.6739403974420594e-16,3")
    expect(radial_line.angle.(42)).to eq(Math::PI)
    radial_line.angle = 20
    expect(radial_line.angle.(42)).to eq(20)
  end

  it ".radius constant" do
    radial_line = D3.radial_line.radius(10)
    expect(radial_line.(simple_data)).to eq("M0,-10L3.090169943749474,-9.510565162951535L5.877852522924732,-8.090169943749475")
    expect(radial_line.radius.(42)).to eq(10)
    radial_line.radius = 20
    expect(radial_line.radius.(42)).to eq(20)
  end

  it ".defined" do
    radial_line = D3.radial_line.defined{|(a,r)| r.even?}
    data = [[0,6], [0,10], [0,11], [0,14], [0,16], [0,19]]
    expect(radial_line.(data)).to eq("M0,-6L0,-10M0,-14L0,-16")
  end
end

__END__

radialLine.context - set the rendering context.
