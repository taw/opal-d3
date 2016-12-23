describe "d3 - symbol" do
  it "d3.symbol" do
    expect(D3.symbol).to be_instance_of(D3::SymbolGenerator)
  end
end
