describe "d3 - sequential scale" do
  let(:scale) { D3.scale_sequential(&D3.send(interpolator)).domain([0, 100]) }
  let(:curve_direct) { (0..20).map{|t| D3.send(interpolator, t/20.0)} }
  let(:curve_scale) { (0..20).map{|t| scale.(t*100/20.0)} }

  it "d3.scale_sequential" do
    expect(D3.scale_sequential(&D3.interpolate_viridis)).to be_instance_of(D3::SequentialScale)
    expect(D3.scale_sequential{|t| D3.hsl(t * 360, 1, 0.5) }).to be_instance_of(D3::SequentialScale)
  end

  it "basics" do
    s = D3.scale_sequential{|t| D3.hsl(t * 360, 1, 0.5).to_s }
    expect(s.domain).to eq([0,1])
    s2 = s.copy.domain([0,100]).clamp(true)
    expect(s.domain).to eq([0,1])
    expect(s2.domain).to eq([0,100])
    expect(s.clamp).to eq(false)
    expect(s2.clamp).to eq(true)
    expect(s.(0.2)).to eq("rgb(204, 255, 0)")
    expect(s.(1.2)).to eq("rgb(204, 255, 0)")
    expect(s2.(20)).to eq("rgb(204, 255, 0)")
    expect(s2.(120)).to eq("rgb(255, 0, 0)")
    expect(s.interpolator.(0.3)).to eq("rgb(51, 255, 0)")
    expect(s2.interpolator.(0.3)).to eq("rgb(51, 255, 0)")
  end

  describe "viridis" do
    let(:interpolator) { :interpolate_viridis }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["#440154", "#471365", "#482475", "#463480", "#414487", "#3b528b", "#355f8d", "#2f6c8e", "#2a788e", "#25848e", "#21918c", "#1e9c89", "#22a884", "#2fb47c", "#44bf70", "#5ec962", "#7ad151", "#9bd93c", "#bddf26", "#dfe318", "#fde725"])
    end
  end

  describe "inferno" do
    let(:interpolator) { :interpolate_inferno }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["#000004", "#07051b", "#160b39", "#2b0b57", "#420a68", "#57106e", "#6a176e", "#7f1e6c", "#932667", "#a82e5f", "#bc3754", "#cc4248", "#dd513a", "#ea632a", "#f37819", "#f98e09", "#fca50a", "#fbbe23", "#f6d746", "#f1ef75", "#fcffa4"])
    end
  end

  describe "magma" do
    let(:interpolator) { :interpolate_magma }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["#000004", "#06051a", "#140e36", "#251255", "#3b0f70", "#51127c", "#641a80", "#782281", "#8c2981", "#a1307e", "#b73779", "#ca3e72", "#de4968", "#ed5a5f", "#f7705c", "#fc8961", "#fe9f6d", "#feb77e", "#fecf92", "#fde7a9", "#fcfdbf"])
    end
  end

  describe "plasma" do
    let(:interpolator) { :interpolate_plasma }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["#0d0887", "#2a0593", "#41049d", "#5601a4", "#6a00a8", "#7e03a8", "#8f0da4", "#a11b9b", "#b12a90", "#bf3984", "#cc4778", "#d6556d", "#e16462", "#ea7457", "#f2844b", "#f89540", "#fca636", "#feba2c", "#fcce25", "#f7e425", "#f0f921"])
    end
  end

  describe "warm" do
    let(:interpolator) { :interpolate_warm }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["rgb(110, 64, 170)", "rgb(129, 62, 176)", "rgb(150, 61, 179)", "rgb(171, 60, 178)", "rgb(191, 60, 175)", "rgb(210, 62, 167)", "rgb(228, 65, 157)", "rgb(242, 69, 145)", "rgb(254, 75, 131)", "rgb(255, 84, 115)", "rgb(255, 94, 99)", "rgb(255, 106, 84)", "rgb(255, 120, 71)", "rgb(255, 135, 59)", "rgb(251, 150, 51)", "rgb(239, 167, 47)", "rgb(226, 183, 47)", "rgb(212, 199, 51)", "rgb(198, 214, 60)", "rgb(186, 228, 73)", "rgb(175, 240, 91)"])
    end
  end

  describe "cool" do
    let(:interpolator) { :interpolate_cool }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["rgb(110, 64, 170)", "rgb(104, 73, 186)", "rgb(96, 84, 200)", "rgb(87, 97, 211)", "rgb(76, 110, 219)", "rgb(65, 125, 224)", "rgb(54, 140, 225)", "rgb(44, 156, 223)", "rgb(35, 171, 216)", "rgb(29, 186, 206)", "rgb(26, 199, 194)", "rgb(26, 212, 179)", "rgb(29, 223, 163)", "rgb(37, 232, 146)", "rgb(48, 239, 130)", "rgb(64, 243, 115)", "rgb(82, 246, 103)", "rgb(103, 247, 94)", "rgb(127, 246, 88)", "rgb(151, 243, 87)", "rgb(175, 240, 91)"])
    end
  end

  describe "rainbow" do
    let(:interpolator) { :interpolate_rainbow }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["rgb(110, 64, 170)", "rgb(150, 61, 179)", "rgb(191, 60, 175)", "rgb(228, 65, 157)", "rgb(254, 75, 131)", "rgb(255, 94, 99)", "rgb(255, 120, 71)", "rgb(251, 150, 51)", "rgb(226, 183, 47)", "rgb(198, 214, 60)", "rgb(175, 240, 91)", "rgb(127, 246, 88)", "rgb(82, 246, 103)", "rgb(48, 239, 130)", "rgb(29, 223, 163)", "rgb(26, 199, 194)", "rgb(35, 171, 216)", "rgb(54, 140, 225)", "rgb(76, 110, 219)", "rgb(96, 84, 200)", "rgb(110, 64, 170)"])
    end
  end

  describe "cubehelix_default" do
    let(:interpolator) { :interpolate_cubehelix_default }
    it do
      expect(curve_direct).to eq(curve_scale)
      expect(curve_scale).to eq(["rgb(0, 0, 0)", "rgb(18, 8, 23)", "rgb(26, 21, 48)", "rgb(26, 39, 68)", "rgb(22, 61, 78)", "rgb(22, 83, 76)", "rgb(31, 102, 66)", "rgb(52, 115, 53)", "rgb(84, 121, 47)", "rgb(122, 122, 53)", "rgb(160, 121, 73)", "rgb(190, 121, 106)", "rgb(208, 126, 147)", "rgb(212, 138, 186)", "rgb(207, 156, 218)", "rgb(199, 179, 237)", "rgb(193, 202, 243)", "rgb(197, 222, 242)", "rgb(210, 238, 239)", "rgb(232, 248, 242)", "rgb(255, 255, 255)"])
    end
  end
end
