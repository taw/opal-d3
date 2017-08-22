describe "d3-collections - nests" do
  it "d3.nest" do
    expect(D3.nest).to be_instance_of(D3::Nest)
  end

  it "zero levels" do
    data = [61, 35, 24, 37, 9, 20, 42, 55, 58, 57]
    nest = D3.nest.sort_values(:ascending)
    expect(nest.entries(data)).to eq(data)
    expect(nest.map(data)).to eq(data)
  end

  it "one level" do
    data = [61, 35, 24, 37, 9, 20, 42, 55, 58, 57]
    nest = D3.nest.key{|x| (x / 10).floor}.sort_keys(:ascending).sort_values(:descending)
    expect(nest.map(data).to_h).to eq(
      {"6"=>[61], "3"=>[37, 35], "2"=>[24, 20], "0"=>[9], "4"=>[42], "5"=>[58, 57, 55]}
    )
    expect(nest.entries(data)).to eq([
      ["0", [9]],
      ["2", [24, 20]],
      ["3", [37, 35]],
      ["4", [42]],
      ["5", [58, 57, 55]],
      ["6", [61]],
    ])
    o = nest.object(data)
    expect(`JSON.stringify(#{o})`).to eq(
      '{"0":[9],"2":[24,20],"3":[37,35],"4":[42],"5":[58,57,55],"6":[61]}'
    )
  end

  it "one level and rollup" do
    data = [61, 35, 24, 37, 9, 20, 42, 55, 58, 57]
    # rollup and sorting got fixed in 4.10
    nest = D3.nest.key{|x| (x / 10).floor}.sort_keys(:ascending)
                  .sort_values(:descending)
                  .rollup{|*x| x.join(":")}
    expect(nest.map(data).to_h).to eq(
      {"6"=>"61", "3"=>"37:35", "2"=>"24:20", "0"=>"9", "4"=>"42", "5"=>"58:57:55"}
    )
    expect(nest.entries(data)).to eq([
      ["0", "9"],
      ["2", "24:20"],
      ["3", "37:35"],
      ["4", "42"],
      ["5", "58:57:55"],
      ["6", "61"]
    ])
  end

  it "three levels" do
    data = (1..25).to_a + (80..85).to_a
    nest = D3.nest.key{|x| "d#{ x % 2}" }.sort_keys(:ascending)
                  .key{|x| "t#{ x % 3}" }.sort_keys(:descending)
                  .key{|x| "v#{ x % 5}" }.sort_keys(:ascending)
                  .sort_values(:descending)
    expect(nest.entries(data)).to eq([
      ["d0", [["t2", [["v0", [80, 20]], ["v2", [2]], ["v3", [8]], ["v4", [14]]]],
              ["t1", [["v0", [10]], ["v1", [16]], ["v2", [82, 22]], ["v4", [4]]]],
              ["t0", [["v1", [6]], ["v2", [12]], ["v3", [18]], ["v4", [84, 24]]]]]],
      ["d1", [["t2", [["v0", [5]], ["v1", [11]], ["v2", [17]], ["v3", [83, 23]]]],
              ["t1", [["v0", [85, 25]], ["v1", [1]], ["v2", [7]], ["v3", [13]], ["v4", [19]]]],
              ["t0", [["v0", [15]], ["v1", [81, 21]], ["v3", [3]], ["v4", [9]]]]]]
    ])
    expect(nest.map(data).inspect).to eq(
      %Q[#<D3::Map: {"d1"=>#<D3::Map: {"t1"=>#<D3::Map: {"v1"=>[1], "v2"=>[7], "v3"=>[13], "v4"=>[19], "v0"=>[85, 25]}>, "t0"=>#<D3::Map: {"v3"=>[3], "v4"=>[9], "v0"=>[15], "v1"=>[81, 21]}>, "t2"=>#<D3::Map: {"v0"=>[5], "v1"=>[11], "v2"=>[17], "v3"=>[83, 23]}>}>, "d0"=>#<D3::Map: {"t2"=>#<D3::Map: {"v2"=>[2], "v3"=>[8], "v4"=>[14], "v0"=>[80, 20]}>, "t1"=>#<D3::Map: {"v4"=>[4], "v0"=>[10], "v1"=>[16], "v2"=>[82, 22]}>, "t0"=>#<D3::Map: {"v1"=>[6], "v2"=>[12], "v3"=>[18], "v4"=>[84, 24]}>}>}>]
    )
  end

  it "three levels and rollup" do
    data = (1..25).to_a + (80..85).to_a
    nest = D3.nest.key{|x| "d#{ x % 2}" }.sort_keys(:ascending)
                  .key{|x| "t#{ x % 3}" }.sort_keys(:descending)
                  .key{|x| "v#{ x % 5}" }.sort_keys(:ascending)
                  .rollup{|*x| x.join(":")}
    expect(nest.entries(data)).to eq([
      ["d0", [["t2", [["v0", "20:80"], ["v2", "2"], ["v3", "8"], ["v4", "14"]]],
              ["t1", [["v0", "10"], ["v1", "16"], ["v2", "22:82"], ["v4", "4"]]],
              ["t0", [["v1", "6"], ["v2", "12"], ["v3", "18"], ["v4", "24:84"]]]]],
      ["d1", [["t2", [["v0", "5"], ["v1", "11"], ["v2", "17"], ["v3", "23:83"]]],
              ["t1", [["v0", "25:85"], ["v1", "1"], ["v2", "7"], ["v3", "13"], ["v4", "19"]]],
              ["t0", [["v0", "15"], ["v1", "21:81"], ["v3", "3"], ["v4", "9"]]]]]
    ])
    expect(nest.map(data).inspect).to eq(
      %Q[#<D3::Map: {"d1"=>#<D3::Map: {"t1"=>#<D3::Map: {"v1"=>"1", "v2"=>"7", "v3"=>"13", "v4"=>"19", "v0"=>"25:85"}>, "t0"=>#<D3::Map: {"v3"=>"3", "v4"=>"9", "v0"=>"15", "v1"=>"21:81"}>, "t2"=>#<D3::Map: {"v0"=>"5", "v1"=>"11", "v2"=>"17", "v3"=>"23:83"}>}>, "d0"=>#<D3::Map: {"t2"=>#<D3::Map: {"v2"=>"2", "v3"=>"8", "v4"=>"14", "v0"=>"20:80"}>, "t1"=>#<D3::Map: {"v4"=>"4", "v0"=>"10", "v1"=>"16", "v2"=>"22:82"}>, "t0"=>#<D3::Map: {"v1"=>"6", "v2"=>"12", "v3"=>"18", "v4"=>"24:84"}>}>}>]
    )
  end
end
