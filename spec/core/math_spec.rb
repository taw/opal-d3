require 'spec_helper'

describe "D3 math methods" do
  it "#min" do
    expect(D3.min([2,1,3])).to eq(2)
  end
end
