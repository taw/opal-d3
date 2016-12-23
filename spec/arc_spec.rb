describe "d3 - arc" do
  it "d3.arc" do
    expect(D3.arc).to be_instance_of(D3::ArcGenerator)
  end

  # That's a weird rounding error, documentation says "M0,-100A100,100,0,0,1,100,0L0,0Z"
  it "basics" do
    arc = D3.arc
      .inner_radius(0)
      .outer_radius(100)
      .start_angle(0)
      .end_angle(Math::PI / 2)
    expect(arc.()).to eq("M6.123233995736766e-15,-100A100,100,0,0,1,100,0L0,0Z")
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
end
