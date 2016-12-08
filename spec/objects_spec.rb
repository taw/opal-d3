# These operate on JS native objects, and might not be that useful from Opal
# Not converting these to work on ruby objects, as ruby standard library
# already has all relevant methods
describe "d3-collections - objects" do
  let(:object) { `{a: 1, b: 2, c: 3}` }

  it "d3.keys" do
    expect(D3.keys(object)).to eq(["a", "b", "c"])
  end

  it "d3.values" do
    expect(D3.values(object)).to eq([1, 2, 3])
  end

  it "d3.entries" do
    expect(D3.entries(object)).to eq([
       ["a",1],
       ["b",2],
       ["c",3],
    ])
  end
end
