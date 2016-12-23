describe "d3 - stack" do
  it "d3.stack" do
    expect(D3.stack).to be_instance_of(D3::StackGenerator)
  end
end
