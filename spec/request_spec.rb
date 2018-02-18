# opal-rspec and async testing don't currently work very well
# so these are completely untested, except for the doesn't crash part
describe "d3-random" do
  it "d3.json" do
    D3.json("/test.json")
  end

  it "d3.json" do
    D3.json("/test.json")
  end

  it "d3.json" do
    D3.json("/test.json")
  end

  it "d3.text" do
    D3.text("/test.text")
  end

  it "d3.tsv" do
    D3.tsv("/test.tsv")
  end

  it "d3.xml" do
    D3.xml("/test.xml")
  end
end
