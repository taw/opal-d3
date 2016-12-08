describe "d3-array - histograms" do
  it "d3.histogram" do
    expect(D3.histogram).to be_a(D3::Histogram)
  end

  describe "histogram.thresholds" do
    let(:data) { (1..10).to_a }
    let(:h) { D3.histogram }
    it "block" do
      h.thresholds{|*args| D3.threshold_sturges(*args) }
      expect(h.(data)).to eq([
        [1],
        [2,3],
        [4,5],
        [6,7],
        [8,9,10]
      ])
    end

    it "symbol" do
      h.thresholds(:scott)
      expect(h.(data)).to eq([
        [1,2,3,4],
        [5,6,7,8,9,10],
      ])
    end

    it "number" do
      h.thresholds(2)
      expect(h.(data)).to eq([
        [1, 2, 3, 4],
        [5, 6, 7, 8, 9, 10]
      ])
    end
  end

  it "histogram.call" do
    h = D3.histogram
    expect(h.([1,2,1,2,1,3])).to eq([
      [1,1,1],
      [],
      [2,2],
      [3],
    ])
  end

  it "d3.threshold_freedman_diaconis" do
    data = (0..10).to_a
    expect(D3.threshold_freedman_diaconis(data,0,10)).to eq(3)
  end

  it "d3.threshold_scott" do
    data = (0..10).to_a
    expect(D3.threshold_scott(data,0,10)).to eq(2)
  end

  it "d3.threshold_sturges" do
    data = (0..10).to_a
    expect(D3.threshold_sturges(data,0,10)).to eq(5)
  end
end
