describe "d3 - interpolate" do
  it "d3.interpolate_number" do
    f = D3.interpolate_number(10,20)
    expect(f.(0.3)).to eq(13)
    expect(f.(0.31)).to eq(13.1)
  end

  it "d3.interpolate_round" do
    f = D3.interpolate_round(10,20)
    expect(f.(0.3)).to eq(13)
    expect(f.(0.31)).to eq(13)
  end

  it "d3.interpolate_string" do
    f = D3.interpolate_string("300 12px sans-serif", "500 36px Comic-Sans")
    expect(f.(0.5)).to eq("400 24px Comic-Sans")
  end

  it "d3.interpolate_array" do
    f = D3.interpolate_array([0, 200], [10, 500])
    expect(f.(0.5)).to eq([5, 350])
  end

  it "d3.interpolate_date" do
    f = D3.interpolate_date(Time.parse("June 30, 2015 00:00:00"), Time.parse("December 31, 2016 12:00:00"))
    expect(f.(0.5)).to eq(Time.parse("March 31, 2016 06:30:00"))
  end

  it "d3.interpolate_rgb" do
    f = D3.interpolate_rgb("purple", "orange")
    expect(f.(0.5)).to eq("rgb(192, 83, 64)")
  end

  it "d3.interpolate_rgb_basis" do
    f = D3.interpolate_rgb_basis(["purple", "orange"])
    expect(f.(0.5)).to eq("rgb(192, 83, 64)")
  end

  it "d3.interpolate_rgb_basis_closed" do
    f = D3.interpolate_rgb_basis_closed(["purple", "orange"])
    expect(f.(0.5)).to eq("rgb(213, 110, 43)")
  end

  it "d3.interpolate_hsl" do
    f = D3.interpolate_hsl("purple", "orange")
    expect(f.(0.5)).to eq("rgb(192, 0, 34)")
  end

  it "d3.interpolate_hsl_long" do
    f = D3.interpolate_hsl_long("purple", "orange")
    expect(f.(0.5)).to eq("rgb(0, 192, 158)")
  end

  it "d3.interpolate_lab" do
    f = D3.interpolate_lab("purple", "orange")
    expect(f.(0.5)).to eq("rgb(197, 93, 91)")
  end

  it "d3.interpolate_hcl" do
    f = D3.interpolate_hcl("purple", "orange")
    expect(f.(0.5)).to eq("rgb(236, 46, 83)")
  end

  it "d3.interpolate_hcl_long" do
    f = D3.interpolate_hcl_long("purple", "orange")
    expect(f.(0.5)).to eq("rgb(0, 153, 169)")
  end

  it "d3.interpolate_cubehelix" do
    f = D3.interpolate_cubehelix("purple", "orange")
    expect(f.(0.5)).to eq("rgb(255, 32, 68)")
  end

  it "d3.interpolate_cubehelix_long" do
    f = D3.interpolate_cubehelix_long("purple", "orange")
    expect(f.(0.5)).to eq("rgb(0, 194, 158)")
  end
end
