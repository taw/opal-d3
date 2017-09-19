describe "d3 - arc" do
  it "d3.arc" do
    expect(D3.arc).to be_instance_of(D3::ArcGenerator)
  end

  let(:example_arc) {
    D3.arc
      .inner_radius(0)
      .outer_radius(100)
      .start_angle(0)
      .end_angle(Math::PI / 2)
  }

  # That's a weird rounding error, documentation says "M0,-100A100,100,0,0,1,100,0L0,0Z"
  it "basics" do
    expect(example_arc.()).to eq("M6.123233995736766e-15,-100A100,100,0,0,1,100,0L0,0Z")
  end

  it "passing hash" do
    arc = D3.arc
    expect(arc.({
      innerRadius: 0,
      outerRadius: 100,
      startAngle: 0,
      endAngle: Math::PI / 2,
    }.to_n)).to eq("M6.123233995736766e-15,-100A100,100,0,0,1,100,0L0,0Z")
  end

  it "arc.inner_radius" do
    arc = D3.arc.inner_radius(20)
    expect(arc.inner_radius.()).to eq(20)
    arc.inner_radius{|t| t*10}
    expect(arc.inner_radius.(12)).to eq(120)
  end

  it "arc.outer_radius" do
    arc = D3.arc.outer_radius(100)
    expect(arc.outer_radius.()).to eq(100)
    arc.outer_radius{|t| t*10}
    expect(arc.outer_radius.(12)).to eq(120)
  end

  it "arc.start_angle" do
    arc = D3.arc.start_angle(Math::PI/2)
    expect(arc.start_angle.()).to eq(Math::PI/2)
    arc.start_angle{|t| t*10}
    expect(arc.start_angle.(12)).to eq(120)
  end

  it "arc.end_angle" do
    arc = D3.arc.end_angle(3*Math::PI/2)
    expect(arc.end_angle.()).to eq(3*Math::PI/2)
    arc.end_angle{|t| t*10}
    expect(arc.end_angle.(12)).to eq(120)
  end

  it "arc.corner_radius" do
    arc = D3.arc.corner_radius(5)
    expect(arc.corner_radius.()).to eq(5)
    arc.corner_radius{|t| t*10}
    expect(arc.corner_radius.(12)).to eq(120)
    expect(example_arc.corner_radius(5).()).to eq(
      "M6.217248937900877e-15,-94.86832980505139"+
      "A5,5,0,0,1,5.263157894736849,-99.86139979479094"+
      "A100,100,0,0,1,99.86139979479093,-5.263157894736842"+
      "A5,5,0,0,1,94.86832980505139,0"+
      "L0,0Z"
    )
  end

  it "arc.centroid" do
    expect(example_arc.centroid).to eq([35.35533905932738, -35.35533905932737])
    expect(D3.arc.centroid({
      innerRadius: 20,
      outerRadius: 40,
      startAngle: Math::PI * 0.25,
      endAngle: Math::PI * 0.75 ,
    }.to_n)).to eq([30,0])
  end
end

__END__

arc.padAngle - set the angle between adjacent arcs, for padded arcs.
arc.padRadius - set the radius at which to linearize padding.
arc.context - set the rendering context.
