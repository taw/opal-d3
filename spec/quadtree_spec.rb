describe "d3 - quadtree" do
  let(:a) { [1,2,"a"] }
  let(:a2) { [1,2,"a"] }
  let(:b) { [3,4,"b"] }
  let(:c) { [5,6,"c"] }
  let(:d) { [7,8,"c"] }
  let(:e) { [3,4,"e"] }

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

  it "quadtree.visit" do
    q = D3.quadtree([a,b,c,e])
    called = []
    q.visit do |node, x0, y0, x1, y1|
      called << [x0, y0, x1, y1, node.internal?, node.leaf?, node.data, !!node.next, node.children && node.children.map{|x| !!x}]
      false
    end
    expect(called).to eq([
      [1, 2, 5, 6, true, false, nil, false, [true, false, false, true]],
      [1, 2, 3, 4, false, true, [1, 2, "a"], false, nil],
      [3, 4, 5, 6, true, false, nil, false, [true, false, false, true]],
      [3, 4, 4, 5, false, true, [3, 4, "e"], true, nil],
      [4, 5, 5, 6, false, true, [5, 6, "c"], false, nil],
    ])
  end

  it "quadtree.visit_after" do
    q = D3.quadtree([a,b,c,e])
    called = []
    q.visit_after do |node, x0, y0, x1, y1|
      called << [x0, y0, x1, y1, node.internal?, node.leaf?, node.data, !!node.next, node.children && node.children.map{|x| !!x}]
      false
    end
    expect(called).to eq([
      [1, 2, 3, 4, false, true, [1, 2, "a"], false, nil],
      [3, 4, 4, 5, false, true, [3, 4, "e"], true, nil],
      [4, 5, 5, 6, false, true, [5, 6, "c"], false, nil],
      [3, 4, 5, 6, true, false, nil, false, [true, false, false, true]],
      [1, 2, 5, 6, true, false, nil, false, [true, false, false, true]],
    ])
  end

  it "quadtree.root" do
    q = D3.quadtree([a,b,c])
    root = q.root
    expect(root).to be_instance_of(D3::Quad)
    expect(root).to be_internal
  end

  it "quadtree.extent" do
    q = D3.quadtree([a,b,c])
    expect(q.extent).to eq([[1, 2], [5, 6]])
    expect(q.extent([[0,0],[10,1]]).extent([[-1,-1],[1,1]]).extent).to eq([[-3, -10], [13, 6]])
  end

  it "quadtree.cover" do
    q = D3.quadtree([a,b,c])
    expect(q.extent).to eq([[1, 2], [5, 6]])
    expect(q.cover(0,0).cover(-2,10).extent).to eq([[-11, -2], [5, 14]])
  end

  it "quadtree.x/y defaults" do
    q = D3.quadtree([a,b,c])
    expect(q.x.(c)).to eq(5)
    expect(q.y.(c)).to eq(6)
  end

  it "quadtree.x/y constructor" do
    q = D3.quadtree([a,b,c], proc{|(x,y,n)| x*10}, proc{|(x,y,n)| y*10})
    expect(q.x.(c)).to eq(50)
    expect(q.y.(c)).to eq(60)
    expect(q.extent).to eq([[10, 20], [74, 84]])
  end

  it "quadtree.x/y" do
    q = D3.quadtree
    q.x{|(x,y,n)| y*100}.y{|(x,y,n)| x*100}.add_all([a,b,c])
    expect(q.x.(c)).to eq(600)
    expect(q.y.(c)).to eq(500)
    expect(q.extent).to eq([[200, 100], [712, 612]])
  end
end
