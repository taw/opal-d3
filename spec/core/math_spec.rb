require 'spec_helper'

describe "D3 math methods" do
  it "#min" do
    expect(d3.JS.min([2,1,3])).to eq(1)
  end

  it "#max" do
    expect(d3.JS.max([2,1,3,0])).to eq(3)
  end
end
