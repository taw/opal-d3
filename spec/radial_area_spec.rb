describe "d3 - radial area" do
  it "d3.radial_area" do
    expect(D3.radial_area).to be_instance_of(D3::RadialAreaGenerator)
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
    let(:radial_area) {
      D3.radial_area
          .angle{|d| (d[:year]-2000)/10 }
          .outer_radius{|d| d[:value] }
          .inner_radius(50)
    }
    it "basics" do
      expect(radial_area.(simple_data).gsub(/\d+\.\d+/){$&.to_f.round(2)}).to eq(%W[
        M60.07,-71.31
        L68.4,-66.43
        L77.42,-61.44
        L84.08,-53.99
        L88.94,-45.27
        L98.02,-16.91
        L49.27,-8.5
        L44.56,-22.68
        L42.07,-27.02
        L39.17,-31.08
        L35.87,-34.84
        L32.21,-38.24
        Z
      ].join)
    end

    it "curve" do
      expect(radial_area.curve).to be_instance_of(D3::Curve)
      expect(radial_area.curve(D3.curve_natural).(simple_data).gsub(/\d+\.\d+/){$&.to_f.round(2)}).to eq(%W[
        M60.07,-71.31C62.74,-69.61,65.42,-67.91,68.4,-66.43
        C71.38,-64.95,74.66,-63.68,77.42,-61.44
        C80.19,-59.2,82.45,-55.98,84.08,-53.99
        C85.71,-52,86.72,-51.24,88.94,-45.27
        C91.16,-39.29,94.59,-28.1,98.02,-16.91
        L49.27,-8.5
        C47.49,-14.1,45.72,-19.7,44.56,-22.68
        C43.4,-25.66,42.87,-26.01,42.07,-27.02
        C41.28,-28.02,40.23,-29.66,39.17,-31.08
        C38.1,-32.5,37.03,-33.68,35.87,-34.84
        C34.71,-35.99,33.46,-37.12,32.21,-38.24
        Z
      ].join)
    end


    it ".defined" do
      expect(radial_area.defined{|d| d[:year] != 2010}.(simple_data).gsub(/\d+\.\d+/){$&.to_f.round(2)}).to eq(%W[
        M60.07,-71.31
        L68.4,-66.43
        L77.42,-61.44
        L39.17,-31.08
        L35.87,-34.84
        L32.21,-38.24
        Z
        M88.94,-45.27
        L98.02,-16.91
        L49.27,-8.5
        L44.56,-22.68
        Z
      ].join)
    end
  end

  describe "line generators" do
    let(:radial_area) {
      D3.radial_area
        .start_angle{|d| (d[:year]-2000)/20 }
        .end_angle{|d| (d[:year]-2000)/10 }
        .outer_radius{|d| d[:value] }
        .inner_radius(50)
    }
    let(:point) { {year: 2042, value: 117 } }

    it ".angle/.start_angle/.end_angle" do
      expect(radial_area.start_angle.(point)).to eq(2.1)
      expect(radial_area.end_angle.(point)).to eq(4.2)
      expect(radial_area.angle.(point)).to eq(2.1)
    end

    it ".radius/.inner_radius/.outer_radius" do
      expect(radial_area.inner_radius.(point)).to eq(50)
      expect(radial_area.outer_radius.(point)).to eq(117)
      expect(radial_area.radius.(point)).to eq(50)
    end

    it ".line_start_angle" do # start_angle inner_radius
      expect(radial_area.line_start_angle).to be_instance_of(D3::RadialLineGenerator)
      expect(radial_area.line_start_angle.angle.(point)).to eq(2.1)
      expect(radial_area.line_start_angle.radius.(point)).to eq(50)
    end

    it ".line_end_angle" do # end_angle inner_radius
      expect(radial_area.line_end_angle).to be_instance_of(D3::RadialLineGenerator)
      expect(radial_area.line_end_angle.angle.(point)).to eq(4.2)
      expect(radial_area.line_end_angle.radius.(point)).to eq(50)
    end

    it ".line_inner_radius" do # start_angle inner_radius
      expect(radial_area.line_inner_radius).to be_instance_of(D3::RadialLineGenerator)
      expect(radial_area.line_inner_radius.angle.(point)).to eq(2.1)
      expect(radial_area.line_inner_radius.radius.(point)).to eq(50)
    end

    it ".line_outer_radius" do # start_angle outer_radius
      expect(radial_area.line_outer_radius).to be_instance_of(D3::RadialLineGenerator)
      expect(radial_area.line_outer_radius.angle.(point)).to eq(2.1)
      expect(radial_area.line_outer_radius.radius.(point)).to eq(117)
    end
  end
end

__END__

radialArea.context - set the rendering context.
