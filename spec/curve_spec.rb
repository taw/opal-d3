describe "d3 - curve" do
  let(:curve) { D3.send(name) }
  # 5   x-x
  #    /   \
  # 4 x    |  x
  #        \ /
  # 3       x
  #   0 1 2 3 4
  let(:data) { [[0, 4], [1, 5], [2, 5], [3, 3], [4, 4]] }
  let(:line) { D3.line.curve(curve).(data) }
  let(:rounded) { line.gsub(/\d+\.\d+/){$&.to_f.round(2)} }
  describe "curve_basis" do
    let(:name){ :curve_basis }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4L0.17,4.17C0.33,4.33,0.67,4.67,1,4.83C1.33,5,1.67,5,2,4.67C2.33,4.33,2.67,3.67,3,3.5C3.33,3.33,3.67,3.67,3.83,3.83L4,4")
    end
  end

  describe "curve_basis_closed" do
    let(:name){ :curve_basis_closed }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M1,4.83C1.33,5,1.67,5,2,4.67C2.33,4.33,2.67,3.67,3,3.5C3.33,3.33,3.67,3.67,3.17,3.83C2.67,4,1.33,4,0.83,4.17C0.33,4.33,0.67,4.67,1,4.83")
    end
  end

  describe "curve_basis_open" do
    let(:name){ :curve_basis_open }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M1,4.83C1.33,5,1.67,5,2,4.67C2.33,4.33,2.67,3.67,3,3.5")
    end
  end

  describe "curve_bundle" do
    let(:name){ :curve_bundle }
    it do
      expect(curve).to be_instance_of(D3::CurveBundle)
      expect(rounded).to eq("M0,4L0.17,4.14C0.33,4.28,0.67,4.57,1,4.71C1.33,4.85,1.67,4.85,2,4.57C2.33,4.28,2.67,3.72,3,3.58C3.33,3.43,3.67,3.72,3.83,3.86L4,4")
    end

    describe ".beta" do
      let(:curve) { D3.curve_bundle.beta(0.5) }
      it do
        expect(curve).to be_instance_of(D3::CurveBundle)
        expect(rounded).to eq("M0,4L0.17,4.08C0.33,4.17,0.67,4.33,1,4.42C1.33,4.5,1.67,4.5,2,4.33C2.33,4.17,2.67,3.83,3,3.75C3.33,3.67,3.67,3.83,3.83,3.92L4,4")
      end
    end
  end

  describe "curve_cardinal" do
    let(:name){ :curve_cardinal }
    it do
      expect(curve).to be_instance_of(D3::CurveCardinal)
      expect(rounded).to eq("M0,4C0,4,0.67,4.83,1,5C1.33,5.17,1.67,5.33,2,5C2.33,4.67,2.67,3.17,3,3C3.33,2.83,4,4,4,4")
    end
    describe ".tension" do
      let(:curve) { D3.curve_cardinal.tension(0.5) }
      it do
        expect(curve).to be_instance_of(D3::CurveCardinal)
        expect(rounded).to eq("M0,4C0,4,0.83,4.92,1,5C1.17,5.08,1.83,5.17,2,5C2.17,4.83,2.83,3.08,3,3C3.17,2.92,4,4,4,4")
      end
    end
  end

  describe "curve_cardinal_closed" do
    let(:name){ :curve_cardinal_closed }
    it do
      expect(curve).to be_instance_of(D3::CurveCardinal)
      expect(rounded).to eq("M1,5C1.33,5.17,1.67,5.33,2,5C2.33,4.67,2.67,3.17,3,3C3.33,2.83,4.5,3.83,4,4C3.5,4.17,0.5,3.83,0,4C-0.5,4.17,0.67,4.83,1,5")
    end
    describe ".tension" do
      let(:curve) { D3.curve_cardinal_closed.tension(0.5) }
      it do
        expect(curve).to be_instance_of(D3::CurveCardinal)
        expect(rounded).to eq("M1,5C1.17,5.08,1.83,5.17,2,5C2.17,4.83,2.83,3.08,3,3C3.17,2.92,4.25,3.92,4,4C3.75,4.08,0.25,3.92,0,4C-0.25,4.08,0.83,4.92,1,5")
      end
    end
  end

  describe "curve_cardinal_open" do
    let(:name){ :curve_cardinal_open }
    it do
      expect(curve).to be_instance_of(D3::CurveCardinal)
      expect(rounded).to eq("M1,5C1.33,5.17,1.67,5.33,2,5C2.33,4.67,2.67,3.17,3,3")
    end
    describe ".tension" do
      let(:curve) { D3.curve_cardinal_open.tension(0.5) }
      it do
        expect(curve).to be_instance_of(D3::CurveCardinal)
        expect(rounded).to eq("M1,5C1.17,5.08,1.83,5.17,2,5C2.17,4.83,2.83,3.08,3,3")
      end
    end
  end

  describe "curve_catmull_rom" do
    let(:name){ :curve_catmull_rom }
    it do
      expect(curve).to be_instance_of(D3::CurveCatmullRom)
      expect(rounded).to eq("M0,4C0,4,0.63,4.85,1,5C1.31,5.13,1.71,5.18,2,5C2.43,4.73,2.62,3.06,3,3C3.3,2.95,4,4,4,4")
    end
    describe ".alpha" do
      let(:curve) { D3.curve_catmull_rom.alpha(0.75) }
      it do
        expect(curve).to be_instance_of(D3::CurveCatmullRom)
        expect(rounded).to eq("M0,4C0,4,0.61,4.85,1,5C1.3,5.11,1.72,5.13,2,5C2.51,4.76,2.59,3,3,3C3.29,3,4,4,4,4")
      end
    end
  end

  describe "curve_catmull_rom_closed" do
    let(:name){ :curve_catmull_rom_closed }
    it do
      expect(curve).to be_instance_of(D3::CurveCatmullRom)
      expect(rounded).to eq("M1,5C1.31,5.13,1.71,5.18,2,5C2.43,4.73,2.62,3.06,3,3C3.3,2.95,4.09,3.79,4,4C3.85,4.35,0.15,3.65,0,4C-0.09,4.21,0.63,4.85,1,5")
    end
    describe ".alpha" do
      let(:curve) { D3.curve_catmull_rom_closed.alpha(0.75) }
      it do
        expect(curve).to be_instance_of(D3::CurveCatmullRom)
        expect(rounded).to eq("M1,5C1.3,5.11,1.72,5.13,2,5C2.51,4.76,2.59,3,3,3C3.29,3,3.96,3.77,4,4C4.08,4.5,-0.08,3.5,0,4C0.04,4.23,0.61,4.85,1,5")
      end
    end
  end

  describe "curve_catmull_rom_open" do
    let(:name){ :curve_catmull_rom_open }
    it do
      expect(curve).to be_instance_of(D3::CurveCatmullRom)
      expect(rounded).to eq("M1,5C1.31,5.13,1.71,5.18,2,5C2.43,4.73,2.62,3.06,3,3")
    end
    describe ".alpha" do
      let(:curve) { D3.curve_catmull_rom_open.alpha(0.75) }
      it do
        expect(curve).to be_instance_of(D3::CurveCatmullRom)
        expect(rounded).to eq("M1,5C1.3,5.11,1.72,5.13,2,5C2.51,4.76,2.59,3,3,3")
      end
    end
  end

  describe "curve_linear" do
    let(:name){ :curve_linear }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4L1,5L2,5L3,3L4,4")
    end
  end

  describe "curve_linear_closed" do
    let(:name){ :curve_linear_closed }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4L1,5L2,5L3,3L4,4Z")
    end
  end

  describe "curve_monotone_x" do
    let(:name){ :curve_monotone_x }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4C0.33,4.5,0.67,5,1,5C1.33,5,1.67,5,2,5C2.33,5,2.67,3,3,3C3.33,3,3.67,3.5,4,4")
    end
  end

  describe "curve_monotone_y" do
    let(:name){ :curve_monotone_y }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4C0.17,4.33,0.33,4.67,1,5C1,5,2,5,2,5C2.67,4.33,3,3.67,3,3C3,3.33,3.5,3.67,4,4")
    end
  end

  describe "curve_natural" do
    let(:name){ :curve_natural }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4C0.33,4.36,0.67,4.71,1,5C1.33,5.29,1.67,5.5,2,5C2.33,4.5,2.67,3.29,3,3C3.33,2.71,3.67,3.36,4,4")
    end
  end

  describe "curve_step" do
    let(:name){ :curve_step }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4L0.5,4L0.5,5L1.5,5L1.5,5L2.5,5L2.5,3L3.5,3L3.5,4L4,4")
    end
  end

  describe "curve_step_after" do
    let(:name){ :curve_step_after }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4L1,4L1,5L2,5L2,5L3,5L3,3L4,3L4,4")
    end
  end

  describe "curve_step_before" do
    let(:name){ :curve_step_before }
    it do
      expect(curve).to be_instance_of(D3::Curve)
      expect(rounded).to eq("M0,4L0,5L1,5L1,5L2,5L2,3L3,3L3,4L4,4")
    end
  end

end

__END__

curve.areaStart - start a new area segment.
curve.areaEnd - end the current area segment.
curve.lineStart - start a new line segment.
curve.lineEnd - end the current line segment.
curve.point - add a point to the current line segment.
