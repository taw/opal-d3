describe "d3 - pie" do
  let(:generated) { pie.(data) }
  let(:rounded) {
    generated.map{|arc| arc.map{|k,v| [k, v.is_a?(Float) ? v.round(2) : v] }.to_h}
  }
  let(:data) { [1, 3, 4] }
  let(:pie) { D3.pie }

  it "d3.pie" do
    expect(D3.pie).to be_instance_of(D3::PieGenerator)
  end

  describe "basics" do
    it do
      expect(rounded).to eq([
        {data: 1, index: 2, value: 1, start_angle: 5.50, end_angle: 6.28, pad_angle: 0},
        {data: 3, index: 1, value: 3, start_angle: 3.14, end_angle: 5.50, pad_angle: 0},
        {data: 4, index: 0, value: 4, start_angle: 0.00, end_angle: 3.14, pad_angle: 0},
      ])
    end
  end

  describe "pie.start_angle" do
    it do
      expect(pie.start_angle.()).to eq(0)
      pie.start_angle(2)
      expect(pie.start_angle.()).to eq(2)
      expect(rounded).to eq([
        {data: 1, index: 2, value: 1, start_angle: 5.75, end_angle: 6.28, pad_angle: 0},
        {data: 3, index: 1, value: 3, start_angle: 4.14, end_angle: 5.75, pad_angle: 0},
        {data: 4, index: 0, value: 4, start_angle: 2.00, end_angle: 4.14, pad_angle: 0},
      ])
    end
  end

  describe "pie.end_angle" do
    it do
      expect(pie.end_angle.()).to eq(2*Math::PI)
      pie.end_angle(4)
      expect(pie.end_angle.()).to eq(4)
      expect(rounded).to eq([
        {data: 1, index: 2, value: 1, start_angle: 3.50, end_angle: 4.00, pad_angle: 0},
        {data: 3, index: 1, value: 3, start_angle: 2.00, end_angle: 3.50, pad_angle: 0},
        {data: 4, index: 0, value: 4, start_angle: 0.00, end_angle: 2.00, pad_angle: 0},
      ])
    end
  end

  describe "pie.pad_angle" do
    it do
      expect(pie.pad_angle.()).to eq(0)
      pie.pad_angle(0.1)
      expect(pie.pad_angle.()).to eq(0.1)
      expect(rounded).to eq([
        {data: 1, index: 2, value: 1, start_angle: 5.44, end_angle: 6.28, pad_angle: 0.1},
        {data: 3, index: 1, value: 3, start_angle: 3.09, end_angle: 5.44, pad_angle: 0.1},
        {data: 4, index: 0, value: 4, start_angle: 0.00, end_angle: 3.09, pad_angle: 0.1},
      ])
    end
  end

  describe "accessors" do
    let(:data) {[
      ["a", 10],
      ["b", 5],
      ["d", 15],
      ["c", 20],
    ]}
    let(:pie) { D3.pie.value{|d| d[1]} }
    let(:order) {
      generated
        .sort_by{|arc| arc[:index] }
        .map{|arc| arc.select{|k,v| k =~ /data|value/ }}
    }
    it "pie.value" do
      expect(order).to eq([
        {"data"=>["c", 20], "value"=>20},
        {"data"=>["d", 15], "value"=>15},
        {"data"=>["a", 10], "value"=>10},
        {"data"=>["b",  5], "value"=> 5},
      ])
    end

    it "pie.sort" do
      pie.sort{|a,b| a <=> b}
      expect(order).to eq([
        {"data"=>["a", 10], "value"=>10},
        {"data"=>["b",  5], "value"=> 5},
        {"data"=>["c", 20], "value"=>20},
        {"data"=>["d", 15], "value"=>15},
      ])
    end

    it "pie.sort - nil" do
      pie.sort(nil)
      expect(order).to eq([
        {"data"=>["a", 10], "value"=>10},
        {"data"=>["b",  5], "value"=> 5},
        {"data"=>["d", 15], "value"=>15},
        {"data"=>["c", 20], "value"=>20},
      ])
    end

    it "pie.sort_values" do
      pie.sort_values{|a,b| a <=> b}
      expect(order).to eq([
        {"data"=>["b",  5], "value"=> 5},
        {"data"=>["a", 10], "value"=>10},
        {"data"=>["d", 15], "value"=>15},
        {"data"=>["c", 20], "value"=>20},
      ])
    end
  end
end
