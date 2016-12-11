describe "d3 - continuous scale" do
  describe "linear" do
    it "d3.scale_linear" do
      expect(D3.scale_linear).to be_instance_of(D3::ContinuousScale)
    end

    it "basics" do
      x = D3.scale_linear.domain([10, 130]).range([0, 960])
      expect(x.domain).to eq([10, 130])
      expect(x.range).to eq([0, 960])
      expect(x.(20)).to eq(80)
      expect(x.(50)).to eq(320)
      expect(x.(-10)).to eq(-160)
      expect(x.invert(-160)).to eq(-10)
    end

    it ".clamp" do
      x = D3.scale_linear.domain([10, 130]).range([0, 960])
      expect(x.clamp).to eq(false)
      x.clamp(true)
      expect(x.clamp).to eq(true)
      expect(x.(-10)).to eq(0)
      expect(x.invert(-160)).to eq(10)
    end

    it ".nice / .copy" do
      x = D3.scale_linear.domain([7, 127]).range([3, 955])
      xn = x.copy.nice
      expect(xn.domain).to eq([0, 130])
      expect(xn.range).to eq([3, 955])

      xc = x.copy
      x5 = x.nice(5)
      expect(x5.domain).to eq([0, 140])
      expect(x5.range).to eq([3, 955])
      expect(xc.domain).to eq([7, 127])
      expect(xc.range).to eq([3, 955])
      expect(x.domain).to eq(x5.domain)
      expect(x.range).to eq(x5.range)
    end

    it "color" do
      color = D3.scale_linear.domain([10, 100]).range(["brown", "steelblue"])
      expect(color.(20)).to eq("rgb(154, 52, 57)")
      expect(color.(50)).to eq("rgb(123, 81, 103)")
    end

    it "color piecewise" do
      color = D3.scale_linear().domain([-1, 0, 1]).range(["red", "white", "green"])
      expect(color.(-1)).to eq("rgb(255, 0, 0)")
      expect(color.(-0.5)).to eq("rgb(255, 128, 128)")
      expect(color.(0)).to eq("rgb(255, 255, 255)")
      expect(color.(+0.5)).to eq("rgb(128, 192, 128)")
      expect(color.(1)).to eq("rgb(0, 128, 0)")
    end
  end

  describe "pow" do
    it "d3.scale_pow" do
      expect(D3.scale_pow).to be_instance_of(D3::PowScale)
      expect(D3.scale_pow.exponent).to eq(1)
    end
  end

  describe "sqrt" do
    it "d3.scale_sqrt" do
      expect(D3.scale_sqrt).to be_instance_of(D3::PowScale)
      expect(D3.scale_sqrt.exponent).to eq(0.5)
    end
  end
end
