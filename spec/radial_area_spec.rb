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
      expect(radial_area.(simple_data)).to eq(%W[
        M60.06685715804231,-71.3138855424057
        L68.3999032672695,-66.43098473625223
        L77.42403174758046,-61.43992926387248
        L84.07978080200502,-53.98700640234453
        L88.94249453413126,-45.26889291827261
        L98.02268464195213,-16.906631704286973
        L49.27248649942301,-8.49835714501205
        L44.56036800307177,-22.679806071278865
        L42.073549240394826,-27.01511529340699
        L39.166345481374165,-31.080498413533224
        L35.86780454497614,-34.83533546735828
        L32.21088436188455,-38.242109364224426
        Z
      ].join)
    end

    it "curve" do
      expect(radial_area.curve).to be_instance_of(D3::Curve)
      expect(radial_area.curve(D3.curve_natural).(simple_data)).to eq(%W[
        M60.06685715804231,-71.3138855424057
        C62.744321193647394,-69.61375635061246,65.42178522925246,-67.91362715881922,68.3999032672695,-66.43098473625223
        C71.37802130528652,-64.94834231368523,74.65679334571553,-63.68318666034452,77.42403174758046,-61.43992926387248
        C80.19127014944539,-59.19667186740044,82.44697491274627,-55.97531272779704,84.07978080200502,-53.98700640234453
        C85.71258669126377,-51.998700076892014,86.72249370648044,-51.243446565590396,88.94249453413126,-45.26889291827261
        C91.16249536178208,-39.29433927095483,94.59259000186711,-28.1004854876209,98.02268464195213,-16.906631704286973L49.27248649942301,-8.49835714501205
        C47.494897414406246,-14.099875292699052,45.717308329389496,-19.701393440386052,44.56036800307177,-22.679806071278865
        C43.40342767675405,-25.658218702171677,42.86713610913538,-26.013525816270313,42.073549240394826,-27.01511529340699
        C41.27996237165427,-28.016704770543665,40.229080201791824,-29.664576610718377,39.166345481374165,-31.080498413533224
        C38.10361076095651,-32.49642021634807,37.029023489983615,-33.68039198180306,35.86780454497614,-34.83533546735828
        C34.70658559996866,-35.99027895291349,33.45873498092661,-37.11619415856896,32.21088436188455,-38.242109364224426Z
      ].join)
    end


    it ".defined" do
      expect(radial_area.defined{|d| d[:year] != 2010}.(simple_data)).to eq(%W[
        M60.06685715804231,-71.3138855424057
        L68.3999032672695,-66.43098473625223
        L77.42403174758046,-61.43992926387248
        L39.166345481374165,-31.080498413533224
        L35.86780454497614,-34.83533546735828
        L32.21088436188455,-38.242109364224426
        Z
        M88.94249453413126,-45.26889291827261
        L98.02268464195213,-16.906631704286973
        L49.27248649942301,-8.49835714501205
        L44.56036800307177,-22.679806071278865
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
