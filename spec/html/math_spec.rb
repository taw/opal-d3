require 'spec_helper'

describe "D3 math methods" do
  it "#min" do
    expect(D3.min([2,1,3])).to eq(1)
    expect(D3.max([2,-1,-3,0], &:-@)).to eq(3)
  end

  it "#max" do
    expect(D3.max([2,1,3,0])).to eq(3)
    expect(D3.max([2,-1,-3,0], &:abs)).to eq(3)
  end
end
