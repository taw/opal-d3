describe "d3 - creator" do
  after(:each) do
    D3.select("#test-area").html("")
  end
  let(:root) { D3.select("#test-area") }
  let(:html) { root.html }

  it "d3.creator" do
    expect(D3.creator("div")).to be_instance_of(D3::Creator)
    D3.select("div").append(D3.creator("span"))
    expect(html).to eq(
      "<span></span>"
    )
  end
end
