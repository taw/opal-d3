describe "d3-array - statistics" do
  it "d3.min" do
    expect(D3.min([2,1,3])).to eq(1)
    expect(D3.max([2,-1,-3,0], &:-@)).to eq(3)
    expect(D3.min([2,1,nil,3])).to eq(1)
    expect(D3.min(["20","3"])).to eq("20")
    expect(D3.min([20,3])).to eq(3)
  end

  it "d3.max" do
    expect(D3.max([2,1,3,0])).to eq(3)
    expect(D3.max([2,-1,-3,0], &:abs)).to eq(3)
  end

  it "d3.extent" do
    expect(D3.extent([2,-1,3])).to eq([-1,3])
    expect(D3.extent([2,-1,nil,3])).to eq([-1,3])
    expect(D3.extent([2,-1,3], &:abs)).to eq([1,3])
    expect(D3.extent([1])).to eq([1,1])
    expect(D3.extent([])).to eq([nil,nil])
  end

  it "d3.sum" do
    expect(D3.sum([1,2,3])).to eq(6)
    expect(D3.sum([1,2,3,nil])).to eq(6)
    expect(D3.sum([1,2,3]){|x| x**2}).to eq(1+4+9)
    expect(D3.sum([])).to eq(0)
  end

  it "d3.mean" do
    expect(D3.mean([1,2,3])).to eq(2)
    expect(D3.mean([1,2,3,nil])).to eq(2)
    expect(D3.mean([1,2,3]){|x| x**2}).to eq((1+4+9)/3)
    expect(D3.mean([1,2,3,4]){|x| x > 3 ? nil : x**2}).to eq((1+4+9)/3)
    expect(D3.mean([])).to eq(nil)
  end

  it "d3.median" do
    expect(D3.median([1,2,3])).to eq(2)
    expect(D3.median([1,2,3,nil,nil])).to eq(2)
    expect(D3.median([])).to eq(nil)
  end

  it "d3.quantile" do
    # Examples from d3 documentation
    expect(D3.quantile([0, 10, 30], 0)).to eq(0)
    expect(D3.quantile([0, 10, 30], 0.5)).to eq(10)
    expect(D3.quantile([0, 10, 30], 1)).to eq(30)
    expect(D3.quantile([0, 10, 30], 0.25)).to eq(5)
    expect(D3.quantile([0, 10, 30], 0.75)).to eq(20)
    expect(D3.quantile([0, 10, 30], 0.1)).to eq(2)
  end

  it "d3.variance" do
    expect(D3.variance([])).to eq(nil)
    expect(D3.variance([1])).to eq(nil)
    expect(D3.variance([10,20,30])).to eq(100)
  end

  it "d3.deviation" do
    expect(D3.deviation([])).to eq(nil)
    expect(D3.deviation([1])).to eq(nil)
    expect(D3.deviation([10,20,30])).to eq(10)
  end
end
