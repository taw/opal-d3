describe "d3 - polygon" do
  let(:square) {
    [[10,10], [40,10], [40,40], [10,40]]
  }
  let(:triangle) {
    [[100,0], [160,0], [130, 40]]
  }
  let(:random_points) {[
    [6, 39], [59, 86], [96, 20], [56, 5], [96, 98],
    [70, 4], [47, 48], [77, 15], [2, 60], [41, 28],
    [56, 59], [10, 15], [79, 12], [82, 97], [71, 14],
    [18, 30], [64, 86], [35, 83], [49, 73], [78, 12],
  ]}

  # signed area
  it "d3.polygon_area" do
    expect(D3.polygon_area(square)).to eq(-900)
    expect(D3.polygon_area(triangle)).to eq(-1200)
  end

  it "d3.polygon_centroid" do
    expect(D3.polygon_centroid(square)).to eq([25, 25])
    expect(D3.polygon_centroid(triangle)).to eq([130, 13.333333333333334])
  end

  it "d3.polygon_length" do
    expect(D3.polygon_length(square)).to eq(120)
    expect(D3.polygon_length(triangle)).to eq(160)
  end

  it "d3.polygon_contains?" do
    expect(D3.polygon_contains?(square, [20, 20])).to eq(true)
    expect(D3.polygon_contains?(square, [50, 20])).to eq(false)
    # Sometimes corners considered "inside"
    expect(D3.polygon_contains?(square, [10, 10])).to eq(true)
  end

  it "d3.polygon_hull" do
    hull = D3.polygon_hull(random_points)
    hull.each do |pt|
      expect(random_points).to include(pt)
    end

    random_points.each do |pt|
      # Sometimes corners not considered "inside"
      expect(D3.polygon_contains?(hull, pt) || hull.include?(pt)).to eq(true)
    end

    expect(D3.polygon_hull([[10,10], [20,20]])).to eq(nil)
  end
end
