describe "d3 - area" do
  it "d3.area" do
    expect(D3.area).to be_instance_of(D3::AreaGenerator)
  end

  let(:simple_data) {[
    {year: 2007, value: 93.24},
    {year: 2008, value: 95.35},
    {year: 2009, value: 98.84},
    {year: 2010, value: 99.92},
    {year: 2011, value: 99.80},
    {year: 2014, value: 99.47},
  ]}

  describe "basics" do
    let(:area) {
      D3.area
          .x{|d| (d[:year]-2000)*10 }
          .y1{|d| d[:value] }
          .y0(50)
    }
    it "basics" do
      expect(area.(simple_data)).to eq(
        "M70,93.24L80,95.35L90,98.84L100,99.92L110,99.8L140,99.47L140,50L110,50L100,50L90,50L80,50L70,50Z"
      )
    end

    it "curve" do
      expect(area.curve).to be_instance_of(D3::Curve)
      expect(area.curve(D3.curve_natural).(simple_data)).to eq(%W[
        M70,93.24
        C73.3652312599681,93.76974481658695,76.7304625199362,94.29948963317388,80,95.35
        C83.2695374800638,96.40051036682611,86.4433811802233,97.97178628389153,90,98.84
        C93.5566188197767,99.70821371610847,97.49601275917065,99.87336523125998,100,99.92
        C102.50398724082935,99.96663476874002,103.5725677830941,99.89475279106857,110,99.8
        C116.4274322169059,99.70524720893143,128.21371610845296,99.5876236044657,140,99.47L140,50
        C128.21371610845296,50,116.4274322169059,50,110,50
        C103.5725677830941,50,102.50398724082936,50,100,50
        C97.49601275917064,50,93.55661881977672,50,90,50
        C86.44338118022328,50,83.2695374800638,50,80,50
        C76.7304625199362,50,73.3652312599681,50,70,50Z
      ].join)
    end

    it ".defined" do
      expect(area.defined{|d| d[:year] != 2010}.(simple_data)).to eq(
        "M70,93.24L80,95.35L90,98.84L90,50L80,50L70,50ZM110,99.8L140,99.47L140,50L110,50Z"
      )
    end
  end

  describe "line generators" do
    let(:area) {
      D3.area
        .x0{|d| (d[:year]-2000)*10 }
        .x1{|d| (d[:year]-2000)*20 }
        .y1{|d| d[:value] }
        .y0(50)
    }
    let(:point) { {year: 2042, value: 117 } }

    it ".x/.x0/.x1" do
      expect(area.x0.(point)).to eq(420)
      expect(area.x1.(point)).to eq(840)
      expect(area.x.(point)).to eq(420)
    end

    it ".y/.y0/.y1" do
      expect(area.y0.(point)).to eq(50)
      expect(area.y1.(point)).to eq(117)
      expect(area.y.(point)).to eq(50)
    end

    it ".line_x0" do # x0 y0
      expect(area.line_x0).to be_instance_of(D3::LineGenerator)
      expect(area.line_x0.x.(point)).to eq(420)
      expect(area.line_x0.y.(point)).to eq(50)
    end

    it ".line_x1" do # x1 y0
      expect(area.line_x1).to be_instance_of(D3::LineGenerator)
      expect(area.line_x1.x.(point)).to eq(840)
      expect(area.line_x1.y.(point)).to eq(50)
    end

    it ".line_y0" do # x0 y0
      expect(area.line_y0).to be_instance_of(D3::LineGenerator)
      expect(area.line_y0.x.(point)).to eq(420)
      expect(area.line_y0.y.(point)).to eq(50)
    end

    it ".line_y1" do # x0 y1
      expect(area.line_y1).to be_instance_of(D3::LineGenerator)
      expect(area.line_y1.x.(point)).to eq(420)
      expect(area.line_y1.y.(point)).to eq(117)
    end
  end
end

__END__

area.context - set the rendering context.
