describe "d3-ease" do
  let(:range) { (0..20).map{|x| x / 20 }}
  let(:curve) { range.map{|t| D3.send(ease, t).round(4) }}
  let(:f) { D3.send(ease) }
  let(:curve_f) { range.map{|t| f.call(t).round(4) } }
  describe "d3.ease_linear" do
    let(:ease) { :ease_linear }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1])
    end
  end

  describe "d3.ease_quad" do
    let(:ease) { :ease_quad }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.005, 0.02, 0.045, 0.08, 0.125, 0.18, 0.245, 0.32, 0.405, 0.5, 0.595, 0.68, 0.755, 0.82, 0.875, 0.92, 0.955, 0.98, 0.995, 1])
    end
  end

  describe "d3.ease_quad_in" do
    let(:ease) { :ease_quad_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0025, 0.01, 0.0225, 0.04, 0.0625, 0.09, 0.1225, 0.16, 0.2025, 0.25, 0.3025, 0.36, 0.4225, 0.49, 0.5625, 0.64, 0.7225, 0.81, 0.9025, 1])
    end
  end

  describe "d3.ease_quad_out" do
    let(:ease) { :ease_quad_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0975, 0.19, 0.2775, 0.36, 0.4375, 0.51, 0.5775, 0.64, 0.6975, 0.75, 0.7975, 0.84, 0.8775, 0.91, 0.9375, 0.96, 0.9775, 0.99, 0.9975, 1])
    end
  end

  describe "d3.ease_quad_in_out" do
    let(:ease) { :ease_quad_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.005, 0.02, 0.045, 0.08, 0.125, 0.18, 0.245, 0.32, 0.405, 0.5, 0.595, 0.68, 0.755, 0.82, 0.875, 0.92, 0.955, 0.98, 0.995, 1])
    end
  end

  describe "d3.ease_cubic" do
    let(:ease) { :ease_cubic }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0005, 0.004, 0.0135, 0.032, 0.0625, 0.108, 0.1715, 0.256, 0.3645, 0.5, 0.6355, 0.744, 0.8285, 0.892, 0.9375, 0.968, 0.9865, 0.996, 0.9995, 1])
    end
  end

  describe "d3.ease_cubic_in" do
    let(:ease) { :ease_cubic_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0001, 0.001, 0.0034, 0.008, 0.0156, 0.027, 0.0429, 0.064, 0.0911, 0.125, 0.1664, 0.216, 0.2746, 0.343, 0.4219, 0.512, 0.6141, 0.729, 0.8574, 1])
    end
  end

  describe "d3.ease_cubic_out" do
    let(:ease) { :ease_cubic_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.1426, 0.271, 0.3859, 0.488, 0.5781, 0.657, 0.7254, 0.784, 0.8336, 0.875, 0.9089, 0.936, 0.9571, 0.973, 0.9844, 0.992, 0.9966, 0.999, 0.9999, 1])
    end
  end

  describe "d3.ease_cubic_in_out" do
    let(:ease) { :ease_cubic_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0005, 0.004, 0.0135, 0.032, 0.0625, 0.108, 0.1715, 0.256, 0.3645, 0.5, 0.6355, 0.744, 0.8285, 0.892, 0.9375, 0.968, 0.9865, 0.996, 0.9995, 1])
    end
  end

  describe "d3.ease_sin" do
    let(:ease) { :ease_sin }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0062, 0.0245, 0.0545, 0.0955, 0.1464, 0.2061, 0.273, 0.3455, 0.4218, 0.5, 0.5782, 0.6545, 0.727, 0.7939, 0.8536, 0.9045, 0.9455, 0.9755, 0.9938, 1])
    end
  end

  describe "d3.ease_sin_in" do
    let(:ease) { :ease_sin_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0031, 0.0123, 0.0276, 0.0489, 0.0761, 0.109, 0.1474, 0.191, 0.2396, 0.2929, 0.3506, 0.4122, 0.4775, 0.546, 0.6173, 0.691, 0.7666, 0.8436, 0.9215, 1])
    end
  end

  describe "d3.ease_sin_out" do
    let(:ease) { :ease_sin_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0785, 0.1564, 0.2334, 0.309, 0.3827, 0.454, 0.5225, 0.5878, 0.6494, 0.7071, 0.7604, 0.809, 0.8526, 0.891, 0.9239, 0.9511, 0.9724, 0.9877, 0.9969, 1])
    end
  end

  describe "d3.ease_sin_in_out" do
    let(:ease) { :ease_sin_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0062, 0.0245, 0.0545, 0.0955, 0.1464, 0.2061, 0.273, 0.3455, 0.4218, 0.5, 0.5782, 0.6545, 0.727, 0.7939, 0.8536, 0.9045, 0.9455, 0.9755, 0.9938, 1])
    end
  end

  describe "d3.ease_exp" do
    let(:ease) { :ease_exp }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0.0005, 0.001, 0.002, 0.0039, 0.0078, 0.0156, 0.0313, 0.0625, 0.125, 0.25, 0.5, 0.75, 0.875, 0.9375, 0.9688, 0.9844, 0.9922, 0.9961, 0.998, 0.999, 0.9995])
    end
  end

  describe "d3.ease_exp_in" do
    let(:ease) { :ease_exp_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0.001, 0.0014, 0.002, 0.0028, 0.0039, 0.0055, 0.0078, 0.011, 0.0156, 0.0221, 0.0313, 0.0442, 0.0625, 0.0884, 0.125, 0.1768, 0.25, 0.3536, 0.5, 0.7071, 1])
    end
  end

  describe "d3.ease_exp_out" do
    let(:ease) { :ease_exp_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.2929, 0.5, 0.6464, 0.75, 0.8232, 0.875, 0.9116, 0.9375, 0.9558, 0.9688, 0.9779, 0.9844, 0.989, 0.9922, 0.9945, 0.9961, 0.9972, 0.998, 0.9986, 0.999])
    end
  end

  describe "d3.ease_exp_in_out" do
    let(:ease) { :ease_exp_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0.0005, 0.001, 0.002, 0.0039, 0.0078, 0.0156, 0.0313, 0.0625, 0.125, 0.25, 0.5, 0.75, 0.875, 0.9375, 0.9688, 0.9844, 0.9922, 0.9961, 0.998, 0.999, 0.9995])
    end
  end

  describe "d3.ease_circle" do
    let(:ease) { :ease_circle }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0025, 0.0101, 0.023, 0.0417, 0.067, 0.1, 0.1429, 0.2, 0.2821, 0.5, 0.7179, 0.8, 0.8571, 0.9, 0.933, 0.9583, 0.977, 0.9899, 0.9975, 1])
    end
  end

  describe "d3.ease_circle_in" do
    let(:ease) { :ease_circle_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0013, 0.005, 0.0113, 0.0202, 0.0318, 0.0461, 0.0633, 0.0835, 0.107, 0.134, 0.1648, 0.2, 0.2401, 0.2859, 0.3386, 0.4, 0.4732, 0.5641, 0.6878, 1])
    end
  end

  describe "d3.ease_circle_out" do
    let(:ease) { :ease_circle_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.3122, 0.4359, 0.5268, 0.6, 0.6614, 0.7141, 0.7599, 0.8, 0.8352, 0.866, 0.893, 0.9165, 0.9367, 0.9539, 0.9682, 0.9798, 0.9887, 0.995, 0.9987, 1])
    end
  end

  describe "d3.ease_circle_in_out" do
    let(:ease) { :ease_circle_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0025, 0.0101, 0.023, 0.0417, 0.067, 0.1, 0.1429, 0.2, 0.2821, 0.5, 0.7179, 0.8, 0.8571, 0.9, 0.933, 0.9583, 0.977, 0.9899, 0.9975, 1])
    end
  end

  describe "d3.ease_bounce" do
    let(:ease) { :ease_bounce }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0189, 0.0756, 0.1702, 0.3025, 0.4727, 0.6806, 0.9264, 0.91, 0.8189, 0.7656, 0.7502, 0.7725, 0.8327, 0.9306, 0.9727, 0.94, 0.9452, 0.9881, 0.9845, 1])
    end
  end

  describe "d3.ease_bounce_in" do
    let(:ease) { :ease_bounce_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0155, 0.0119, 0.0548, 0.06, 0.0273, 0.0694, 0.1673, 0.2275, 0.2498, 0.2344, 0.1811, 0.09, 0.0736, 0.3194, 0.5273, 0.6975, 0.8298, 0.9244, 0.9811, 1])
    end
  end

  describe "d3.ease_bounce_out" do
    let(:ease) { :ease_bounce_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0189, 0.0756, 0.1702, 0.3025, 0.4727, 0.6806, 0.9264, 0.91, 0.8189, 0.7656, 0.7502, 0.7725, 0.8327, 0.9306, 0.9727, 0.94, 0.9452, 0.9881, 0.9845, 1])
    end
  end

  describe "d3.ease_bounce_in_out" do
    let(:ease) { :ease_bounce_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0059, 0.03, 0.0347, 0.1138, 0.1172, 0.045, 0.1597, 0.3488, 0.4622, 0.5, 0.5378, 0.6512, 0.8403, 0.955, 0.8828, 0.8863, 0.9653, 0.97, 0.9941, 1])
    end
  end

  describe "d3.ease_poly_in" do
    let(:ease) { :ease_poly_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0001, 0.001, 0.0034, 0.008, 0.0156, 0.027, 0.0429, 0.064, 0.0911, 0.125, 0.1664, 0.216, 0.2746, 0.343, 0.4219, 0.512, 0.6141, 0.729, 0.8574, 1])
    end

    describe "custom exponent" do
      let(:f) { D3.send(ease).exponent(2) }
      it do
        expect(curve_f).to eq([0, 0.0025, 0.01, 0.0225, 0.04, 0.0625, 0.09, 0.1225, 0.16, 0.2025, 0.25, 0.3025, 0.36, 0.4225, 0.49, 0.5625, 0.64, 0.7225, 0.81, 0.9025, 1])
      end
    end
  end

  describe "d3.ease_poly_out" do
    let(:ease) { :ease_poly_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.1426, 0.271, 0.3859, 0.488, 0.5781, 0.657, 0.7254, 0.784, 0.8336, 0.875, 0.9089, 0.936, 0.9571, 0.973, 0.9844, 0.992, 0.9966, 0.999, 0.9999, 1])
    end

    describe "custom exponent" do
      let(:f) { D3.send(ease).exponent(2) }
      it do
        expect(curve_f).to eq([0, 0.0975, 0.19, 0.2775, 0.36, 0.4375, 0.51, 0.5775, 0.64, 0.6975, 0.75, 0.7975, 0.84, 0.8775, 0.91, 0.9375, 0.96, 0.9775, 0.99, 0.9975, 1])
      end
    end
  end

  describe "d3.ease_poly_in_out" do
    let(:ease) { :ease_poly_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.0005, 0.004, 0.0135, 0.032, 0.0625, 0.108, 0.1715, 0.256, 0.3645, 0.5, 0.6355, 0.744, 0.8285, 0.892, 0.9375, 0.968, 0.9865, 0.996, 0.9995, 1])
    end

    describe "custom exponent" do
      let(:f) { D3.send(ease).exponent(2) }
      it do
        expect(curve_f).to eq([0, 0.005, 0.02, 0.045, 0.08, 0.125, 0.18, 0.245, 0.32, 0.405, 0.5, 0.595, 0.68, 0.755, 0.82, 0.875, 0.92, 0.955, 0.98, 0.995, 1])
      end
    end
  end

  describe "d3.ease_back_in" do
    let(:ease) { :ease_back_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, -0.0039, -0.0143, -0.0292, -0.0465, -0.0641, -0.0802, -0.0926, -0.0994, -0.0984, -0.0877, -0.0653, -0.029, 0.023, 0.0929, 0.1826, 0.2942, 0.4297, 0.5912, 0.7806, 1])
    end

    describe "custom overshoot" do
      let(:f) { D3.send(ease).overshoot(4) }
      it do
        expect(curve_f).to eq([0, -0.0094, -0.035, -0.0731, -0.12, -0.1719, -0.225, -0.2756, -0.32, -0.3544, -0.375, -0.3781, -0.36, -0.3169, -0.245, -0.1406, 0, 0.1806, 0.405, 0.6769, 1])
      end
    end
  end

  describe "d3.ease_back_out" do
    let(:ease) { :ease_back_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.2194, 0.4088, 0.5703, 0.7058, 0.8174, 0.9071, 0.977, 1.029, 1.0653, 1.0877, 1.0984, 1.0994, 1.0926, 1.0802, 1.0641, 1.0465, 1.0292, 1.0143, 1.0039, 1])
    end

    describe "custom overshoot" do
      let(:f) { D3.send(ease).overshoot(4) }
      it do
        expect(curve_f).to eq([0, 0.3231, 0.595, 0.8194, 1, 1.1406, 1.245, 1.3169, 1.36, 1.3781, 1.375, 1.3544, 1.32, 1.2756, 1.225, 1.1719, 1.12, 1.0731, 1.035, 1.0094, 1])
      end
    end
  end

  describe "d3.ease_back" do
    let(:ease) { :ease_back }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, -0.0072, -0.0232, -0.0401, -0.0497, -0.0438, -0.0145, 0.0464, 0.1471, 0.2956, 0.5, 0.7044, 0.8529, 0.9536, 1.0145, 1.0438, 1.0497, 1.0401, 1.0232, 1.0072, 1])
    end

    describe "custom overshoot" do
      let(:f) { D3.send(ease).overshoot(4) }
      it do
        expect(curve_f).to eq([0, -0.0175, -0.06, -0.1125, -0.16, -0.1875, -0.18, -0.1225, 0, 0.2025, 0.5, 0.7975, 1, 1.1225, 1.18, 1.1875, 1.16, 1.1125, 1.06, 1.0175, 1])
      end
    end
  end

  describe "d3.ease_back_in_out" do
    let(:ease) { :ease_back_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, -0.0072, -0.0232, -0.0401, -0.0497, -0.0438, -0.0145, 0.0464, 0.1471, 0.2956, 0.5, 0.7044, 0.8529, 0.9536, 1.0145, 1.0438, 1.0497, 1.0401, 1.0232, 1.0072, 1])
    end

    describe "custom overshoot" do
      let(:f) { D3.send(ease).overshoot(4) }
      it do
        expect(curve_f).to eq([0, -0.0175, -0.06, -0.1125, -0.16, -0.1875, -0.18, -0.1225, 0, 0.2025, 0.5, 0.7975, 1, 1.1225, 1.18, 1.1875, 1.16, 1.1125, 1.06, 1.0175, 1])
      end
    end
  end

  describe "d3.ease_elastic_in" do
    let(:ease) { :ease_elastic_in }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([-0.0005, 0.0007, 0.002, 0.0014, -0.002, -0.0055, -0.0039, 0.0055, 0.0156, 0.011, -0.0156, -0.0442, -0.0313, 0.0442, 0.125, 0.0884, -0.125, -0.3536, -0.25, 0.3536, 1])
    end

    describe "custom amplitude/period" do
      let(:f) { D3.send(ease).amplitude(2).period(0.2) }
      it do
        expect(curve_f).to eq([0.001, -0.0024, -0.002, 0.0048, 0.0039, -0.0096, -0.0078, 0.0191, 0.0156, -0.0383, -0.0313, 0.0765, 0.0625, -0.1531, -0.125, 0.3062, 0.25, -0.6124, -0.5, 1.2247, 1])
      end
    end
  end

  describe "d3.ease_elastic_out" do
    let(:ease) { :ease_elastic_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.6464, 1.25, 1.3536, 1.125, 0.9116, 0.875, 0.9558, 1.0313, 1.0442, 1.0156, 0.989, 0.9844, 0.9945, 1.0039, 1.0055, 1.002, 0.9986, 0.998, 0.9993, 1.0005])
    end

    describe "custom amplitude/period" do
      let(:f) { D3.send(ease).amplitude(2).period(0.2) }
      it do
        expect(curve_f).to eq([0, -0.2247, 1.5, 1.6124, 0.75, 0.6938, 1.125, 1.1531, 0.9375, 0.9235, 1.0313, 1.0383, 0.9844, 0.9809, 1.0078, 1.0096, 0.9961, 0.9952, 1.002, 1.0024, 0.999])
      end
    end
  end

  describe "d3.ease_elastic" do
    let(:ease) { :ease_elastic }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([0, 0.6464, 1.25, 1.3536, 1.125, 0.9116, 0.875, 0.9558, 1.0313, 1.0442, 1.0156, 0.989, 0.9844, 0.9945, 1.0039, 1.0055, 1.002, 0.9986, 0.998, 0.9993, 1.0005])
    end

    describe "custom amplitude/period" do
      let(:f) { D3.send(ease).amplitude(2).period(0.2) }
      it do
        expect(curve_f).to eq([0, -0.2247, 1.5, 1.6124, 0.75, 0.6938, 1.125, 1.1531, 0.9375, 0.9235, 1.0313, 1.0383, 0.9844, 0.9809, 1.0078, 1.0096, 0.9961, 0.9952, 1.002, 1.0024, 0.999])
      end
    end
  end

  describe "d3.ease_elastic_in_out" do
    let(:ease) { :ease_elastic_in_out }
    it do
      expect(curve).to eq(curve_f)
      expect(curve).to eq([-0.0002, 0.001, -0.001, -0.002, 0.0078, -0.0078, -0.0156, 0.0625, -0.0625, -0.125, 0.5, 1.125, 1.0625, 0.9375, 1.0156, 1.0078, 0.9922, 1.002, 1.001, 0.999, 1.0002])
    end

    describe "custom amplitude/period" do
      let(:f) { D3.send(ease).amplitude(2).period(0.2) }
      it do
        expect(curve_f).to eq([0.0005, -0.001, 0.002, -0.0039, 0.0078, -0.0156, 0.0313, -0.0625, 0.125, -0.25, 0.5, 1.25, 0.875, 1.0625, 0.9688, 1.0156, 0.9922, 1.0039, 0.998, 1.001, 0.9995])
      end
    end
  end
end
