require "time"

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

    it "range_round" do
      x = D3.scale_linear.domain([0,6]).range([0, 100])
      y = D3.scale_linear.domain([0,6]).range_round([0, 100])
      expect(x.(4)).to eq(66.66666666666666)
      expect(y.(4)).to eq(67)
    end

    describe "interpolate" do
      let(:x) { D3.scale_linear.domain([0,6]).range([0, 100]) }
      let(:xf) { x.copy.interpolate{|a,b| proc{|t| (a + (b-a)*t).floor }}}
      let(:xc) { x.copy.interpolate{|a,b| proc{|t| (a + (b-a)*t).ceil }}}
      let(:xr) { x.copy.interpolate(&D3.interpolate_round) }
      it "floor" do
        expect(xf.(4)).to eq(66)
      end
      it "ceil" do
        expect(xc.(4)).to eq(67)
      end
      it "round" do
        expect(xr.(4)).to eq(67)
      end
      it "get interpolator" do
        expect(x.interpolate.(0,10).(0.34)).to eq(3.4000000000000004)
        expect(xr.interpolate.(0,10).(0.34)).to eq(3)
      end
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
      color = D3.scale_linear.domain([-1, 0, 1]).range(["red", "white", "green"])
      expect(color.(-1)).to eq("rgb(255, 0, 0)")
      expect(color.(-0.5)).to eq("rgb(255, 128, 128)")
      expect(color.(0)).to eq("rgb(255, 255, 255)")
      expect(color.(+0.5)).to eq("rgb(128, 192, 128)")
      expect(color.(1)).to eq("rgb(0, 128, 0)")
    end

    it ".ticks / .tick_format" do
      x = D3.scale_linear.domain([-1, 1]).range([0, 960])
      expect(x.ticks(5)).to eq([-1, -0.5, 0, 0.5, 1])
      expect(x.ticks.map{|v| v.round(2)}).to eq([-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1])
      tick_format = x.tick_format(5, "+%")
      expect(x.ticks(5).map(&tick_format)).to eq(["-100%", "-50%", "+0%", "+50%", "+100%"])
    end
  end

  describe "pow" do
    it "d3.scale_pow" do
      expect(D3.scale_pow).to be_instance_of(D3::PowScale)
      expect(D3.scale_pow.exponent).to eq(1)
    end

    it "basics" do
      x = D3.scale_pow.exponent(2).domain([0, 10]).range([0, 10000])
      expect(x.(5)).to eq(2500)
      expect(x.invert(4900)).to eq(7)
    end
  end

  describe "sqrt" do
    it "d3.scale_sqrt" do
      expect(D3.scale_sqrt).to be_instance_of(D3::PowScale)
      expect(D3.scale_sqrt.exponent).to eq(0.5)
    end
  end

  describe "log" do
    it 'd3.scale_log' do
      expect(D3.scale_log).to be_instance_of(D3::LogScale)
      expect(D3.scale_log.base).to eq(10)
    end

    it "basics" do
      x = D3.scale_log.base(2).domain([1, 1024]).range([0, 100])
      expect(x.(256)).to eq(80)
      expect(x.invert(50)).to eq(32)
    end
  end

  describe "identity" do
    it 'd3.scale_log' do
      expect(D3.scale_identity).to be_instance_of(D3::ContinuousScale)
    end

    it "basics" do
      x = D3.scale_identity.domain([10,20])
      expect(x.(16)).to eq(16)
      expect(x.invert(12)).to eq(12)
      expect(x.domain).to eq([10,20])
      expect(x.range).to eq([10,20])
    end
  end

  # Sadly this can't be tested totally properly due to ridiculous mess
  # javascript timezone management is
  describe "time" do
    let(:x) { D3.scale_time.domain([Time.parse("Jan 01 1990 00:00:00"), Time.parse(Time.parse("Jan 01 1998 00:00:00"))]).range([0,100]) }
    let(:y) { D3.scale_utc.domain([Time.parse("Jan 01 1990 00:00:00"), Time.parse(Time.parse("Jan 01 1998 00:00:00"))]).range([0,100]) }
    it "d3.scale_time" do
      expect(D3.scale_time).to be_instance_of(D3::ContinuousScale)
    end

    it "d3.scale_utc" do
      expect(D3.scale_utc).to be_instance_of(D3::ContinuousScale)
    end

    it "basics" do
      expect(x.(Time.parse("Jul 01 1995 00:00:00")).round(1)).to eq(68.7)
    end

    it "invert" do
      expect(x.invert(75).to_s).to eq("1996-01-01 12:00:00 -0000")
    end

    it "ticks" do
      expect(x.ticks(4).map(&:to_s)).to eq([
        "1990-01-01 00:00:00 -0000",
        "1992-01-01 00:00:00 -0000",
        "1994-01-01 00:00:00 -0000",
        "1996-01-01 00:00:00 -0000",
        "1998-01-01 00:00:00 -0000",
      ])
    end

    it "ticks interval" do
      expect(x.ticks(D3.time_month.every(8)).map{|d| d.to_s.split[0]}).to eq([
        "1990-01-01",
        "1990-09-01",
        "1991-01-01",
        "1991-09-01",
        "1992-01-01",
        "1992-09-01",
        "1993-01-01",
        "1993-09-01",
        "1994-01-01",
        "1994-09-01",
        "1995-01-01",
        "1995-09-01",
        "1996-01-01",
        "1996-09-01",
        "1997-01-01",
        "1997-09-01",
        "1998-01-01",
      ])
    end

    it "utc ticks interval" do
      expect(y.ticks(D3.utc_month.every(8)).map{|d| d.to_s.split[0]}).to eq([
        "1990-01-01",
        "1990-09-01",
        "1991-01-01",
        "1991-09-01",
        "1992-01-01",
        "1992-09-01",
        "1993-01-01",
        "1993-09-01",
        "1994-01-01",
        "1994-09-01",
        "1995-01-01",
        "1995-09-01",
        "1996-01-01",
        "1996-09-01",
        "1997-01-01",
        "1997-09-01",
        "1998-01-01",
      ])
    end
  end
end
