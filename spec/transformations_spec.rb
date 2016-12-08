describe "d3-array - transformations" do
  it "d3.merge" do
    expect(D3.merge([[1], [2, 3]])).to eq([1, 2, 3])
  end

  it "d3.pairs" do
    expect(D3.pairs([1, 2, 3, 4])).to eq([[1, 2], [2, 3], [3, 4]])
  end

  it "d3.permute" do
    expect(D3.permute(["a", "b", "c"], [1, 2, 0])).to eq(["b", "c", "a"])
  end

  it "d3.shuffle" do
    a = (1..20).to_a
    b = (1..20).to_a
    D3.shuffle(b)  # modifies in place
    expect(a).not_to eq(b) # 61 bit chance of random test fail
    expect(a.sort).to eq(b.sort)
  end

  it "d3.ticks" do
    expect(D3.ticks(1, 47, 5)).to eq([10, 20, 30, 40])
  end

  it "d3.tick_step" do
    expect(D3.tick_step(1, 47, 5)).to eq(10)
  end

  it "d3.range" do
    expect(D3.range(5)).to eq([0,1,2,3,4])
    expect(D3.range(2, 7)).to eq([2,3,4,5,6])
    expect(D3.range(10,50,5)).to eq([10,15,20,25,30,35,40,45])
    expect(D3.range(0, 1, 0.2)).to eq([0, 0.2, 0.4, 0.6000000000000001, 0.8])
  end

  it "d3.transpose" do
    expect(D3.transpose([[1,2],[3,4]])).to eq([[1,3],[2,4]])
  end

  it "d3.zip" do
    expect(D3.zip([1, 2], [3, 4])).to eq([[1, 3], [2, 4]])
    expect(D3.zip([1, 2, 5], [3, 4])).to eq([[1, 3], [2, 4]])
    expect(D3.zip([1, 2], [3, 4, 5])).to eq([[1, 3], [2, 4]])
    expect(D3.zip([1, 2], [3, 4], [5, 6])).to eq([[1, 3, 5], [2, 4, 6]])
    expect(D3.zip([1, 2])).to eq([[1], [2]])
    expect(D3.zip([1, 2], [])).to eq([])
    expect(D3.zip([])).to eq([])
    expect(D3.zip()).to eq([])
  end
end
