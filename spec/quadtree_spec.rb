describe "d3 - quadtree" do
  let(:a) { [1,2,"a"] }
  let(:a2) { [1,2,"a"] }
  let(:b) { [3,4,"b"] }
  let(:c) { [5,6,"c"] }
  let(:d) { [7,8,"c"] }

  it "d3.quadtree" do
    expect(D3.quadtree).to be_instance_of(D3::QuadTree)
  end

  it "quadtree.size" do
    q = D3.quadtree
    expect(q.size).to eq(0)
    expect(q.add(a).size).to eq(1)
    expect(q.add(b).size).to eq(2)
  end

  it "quadtree.remove" do
    q = D3.quadtree
    expect(q.size).to eq(0)
    expect(q.add(a).add(b).size).to eq(2)
    expect(q.remove(a2).size).to eq(2)
    expect(q.remove(a).size).to eq(1)
    expect(q.remove(c).size).to eq(1)
  end

  it "quadtree.remove_all" do
    q = D3.quadtree([a,b,c])
    expect(q.remove_all([b,d]).data).to eq([a,c])
  end

  it "quadtree.data" do
    q = D3.quadtree
    expect(q.data).to eq([])
    expect(q.add(a).data).to eq([a])
    expect(q.add_all([b,c]).data).to eq([a,b,c])
  end

  it "quadtree.find" do
    q = D3.quadtree
    expect(q.find(1,1)).to eq(nil)
    q.add([1,2,"foo"])
    expect(q.find(3,3)).to eq([1,2,"foo"])
    expect(q.find(3,3,1)).to eq(nil)
  end

  it "quadtree.copy" do
    q1 = D3.quadtree.add(a)
    q2 = q1.copy.add(b)
    q1.add(c)
    expect(q1.data).to eq([a,c])
    expect(q2.data).to eq([a,b])
  end
end
