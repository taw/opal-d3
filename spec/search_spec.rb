describe "d3-array - search" do
  it "d3.ascending" do
    expect(D3.ascending(2,1)).to eq(1)
    expect(D3.ascending(1,1)).to eq(0)
    expect(D3.ascending(1,2)).to eq(-1)
  end

  it "d3.descending" do
    expect(D3.descending(2,1)).to eq(-1)
    expect(D3.descending(1,1)).to eq(0)
    expect(D3.descending(1,2)).to eq(1)
  end

  it "d3.scan" do
    array = [13,5,11,26,32]
    expect(D3.scan(array)).to eq(1)
    expect(D3.scan(array){|a,b| (a%10) - (b%10)}).to eq(2)
    expect(D3.scan(array){|a,b| (b%10) - (a%10)}).to eq(3)
  end

  it "d3.bisect_left" do
    array = (100..200).to_a
    expect(D3.bisect_left(array, 117)).to eq(17)
    expect(D3.bisect_left(array, 130.5)).to eq(31)
  end

  it "d3.bisect_right" do
    array = (100..200).to_a
    expect(D3.bisect_right(array, 117)).to eq(18)
    expect(D3.bisect_right(array, 130.5)).to eq(31)
  end

  it "d3.bisect" do
    array = (100..200).to_a
    expect(D3.bisect(array, 117)).to eq(18)
    expect(D3.bisect(array, 130.5)).to eq(31)
  end

  it "d3.bisector" do
    expect(D3.bisector{|x| x.abs}).to be_instance_of(D3::Bisector)
    expect(D3.bisector{|x,y| x.abs - y.abs}).to be_instance_of(D3::Bisector)
  end

  describe "D3::Bisector" do
    let(:array) { (100..200).map{|i| i * (-1)**i} }
    let(:a) { D3.bisector{|x| x.abs} }
    let(:c) { D3.bisector{|x,y| x.abs - y.abs} }

    it "A.left" do
      expect(a.left(array, 117)).to eq(17)
      expect(a.left(array, 130.5)).to eq(31)
    end

    it "C.left" do
      expect(c.left(array, 117)).to eq(17)
      expect(c.left(array, 130.5)).to eq(31)
    end

    it "A.right" do
      expect(a.right(array, 117)).to eq(18)
      expect(a.right(array, 130.5)).to eq(31)
    end

    it "C.right" do
      expect(c.right(array, 117)).to eq(18)
      expect(c.right(array, 130.5)).to eq(31)
    end
  end
end
