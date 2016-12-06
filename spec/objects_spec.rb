require 'spec_helper'

# These operate on JS native objects, and might not be that useful from Opal
# Not converting these to work on ruby objects, as ruby standard library
# already has all relevant methods
describe "d3-collections - objects" do
  let(:object) { `{a: 1, b: 2, c: 3}` }

  it "#keys" do
    expect(D3.keys(object)).to eq(["a", "b", "c"])
  end

  it "#values" do
    expect(D3.values(object)).to eq([1, 2, 3])
  end

  it "#entries" do
    expect(D3.entries(object).map{|x| `JSON.stringify(x)`}).to eq([
       '{"key":"a","value":1}',
       '{"key":"b","value":2}',
       '{"key":"c","value":3}',
    ])
  end
end
