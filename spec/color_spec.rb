describe "d3-colors" do
  it "d3.color" do
    expect(D3.color("blue")).to be_instance_of(D3::Color)
  end

  it "supported syntax" do
    expect(D3.color("rgb(255, 255, 255)").to_s).to eq("rgb(255, 255, 255)")
    expect(D3.color("rgb(10%, 20%, 30%)").to_s).to eq("rgb(26, 51, 77)")
    expect(D3.color("rgba(255, 255, 255, 0.4)").to_s).to eq("rgba(255, 255, 255, 0.4)")
    expect(D3.color("rgba(10%, 20%, 30%, 0.4)").to_s).to eq("rgba(26, 51, 77, 0.4)")
    expect(D3.color("hsl(120, 50%, 20%)").to_s).to eq("rgb(25, 77, 25)")
    expect(D3.color("hsla(120, 50%, 20%, 0.4)").to_s).to eq("rgba(25, 77, 25, 0.4)")
    expect(D3.color("#ffeeaa").to_s).to eq("rgb(255, 238, 170)")
    expect(D3.color("#fea").to_s).to eq("rgb(255, 238, 170)")
    expect(D3.color("steelblue").to_s).to eq("rgb(70, 130, 180)")
  end

  it "invalid colors" do
    expect{ D3.color("poop_emoji") }.to raise_error(/Invalid color/)
  end

  it "color.brighter" do
    steelblue = D3.color("steelblue")
    expect(steelblue.brighter.to_s).to eq("rgb(100, 186, 255)")
    expect(steelblue.brighter(0.25).to_s).to eq("rgb(77, 142, 197)")
  end

  it "color.darker" do
    steelblue = D3.color("steelblue")
    expect(steelblue.darker.to_s).to eq("rgb(49, 91, 126)")
    expect(steelblue.darker(0.25).to_s).to eq("rgb(64, 119, 165)")
  end

  it "color.displayable?" do
    expect(D3.color("rgb(255,255,255)")).to be_displayable
    expect(D3.color("rgb(260,260,260)")).to_not be_displayable
  end

  it "d3.rgb" do
    steelblue = D3.rgb("steelblue")
    expect([steelblue.r, steelblue.g, steelblue.b]).to eq([70, 130, 180])
    expect(D3.rgb(10,20,30).to_s).to eq("rgb(10, 20, 30)")
    expect(D3.rgb(10,20,30,0.5).to_s).to eq("rgba(10, 20, 30, 0.5)")
    expect(D3.rgb(D3.hsl("steelblue")).to_s).to eq("rgb(70, 130, 180)")
  end

  it "d3.hsl" do
    steelblue = D3.hsl("steelblue")
    expect([steelblue.h, steelblue.s, steelblue.l]).to eq([207.27272727272728, 0.44, 0.4901960784313726])
    expect(D3.hsl(207.27272727272728, 0.44, 0.4901960784313726).to_s).to eq("rgb(70, 130, 180)")
    expect(D3.hsl(207.27272727272728, 0.44, 0.4901960784313726, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end

  it "d3.lab" do
    steelblue = D3.lab("steelblue")
    expect([steelblue.l, steelblue.a, steelblue.b]).to eq([52.46551718768575, -4.0774710123572255, -32.19186122981343])
    expect(D3.lab(52.46551718768575, -4.0774710123572255, -32.19186122981343).to_s).to eq("rgb(70, 130, 180)")
    expect(D3.lab(52.46551718768575, -4.0774710123572255, -32.19186122981343, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end

  it "d3.hcl" do
    steelblue = D3.hcl("steelblue")
    expect([steelblue.h, steelblue.c, steelblue.l]).to eq([262.78126775909277, 32.44906314974561, 52.46551718768575])
    expect(D3.hcl(262.78126775909277, 32.44906314974561, 52.46551718768575).to_s).to eq("rgb(70, 130, 180)")
    expect(D3.hcl(262.78126775909277, 32.44906314974561, 52.46551718768575, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end

  it "d3.cubehelix" do
    steelblue = D3.cubehelix("steelblue")
    expect([steelblue.h, steelblue.s, steelblue.l]).to eq([202.84837896488932, 0.6273147230777709, 0.460784355920337])
    expect(D3.cubehelix(202.84837896488932, 0.6273147230777709, 0.460784355920337).to_s).to eq("rgb(70, 130, 180)")
    expect(D3.cubehelix(202.84837896488932, 0.6273147230777709, 0.460784355920337, 0.5).to_s).to eq("rgba(70, 130, 180, 0.5)")
  end
end
