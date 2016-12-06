require 'spec_helper'

describe "d3-array - histograms" do
  it "#threshold_freedman_diaconis" do
    data = (0..10).to_a
    expect(D3.threshold_freedman_diaconis(data,0,10)).to eq(3)
  end

  it "#threshold_scott" do
    data = (0..10).to_a
    expect(D3.threshold_scott(data,0,10)).to eq(2)
  end

  it "#threshold_sturges" do
    data = (0..10).to_a
    expect(D3.threshold_sturges(data,0,10)).to eq(5)
  end
end
