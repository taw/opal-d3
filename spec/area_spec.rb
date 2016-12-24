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
