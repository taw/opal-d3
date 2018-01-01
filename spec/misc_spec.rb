describe "d3 misc methods" do
  it "d3.version" do
    # opal-d3 is highly compatible with various d3 minor updates,
    # but we're only testing against one bundled here
    expect(D3.version).to eq("4.12.2")
  end

  it "d3.namespace" do
    expect(D3.namespace("svg:text")).to eq({"space"=>"http://www.w3.org/2000/svg", "local"=>"text"})
  end

  it "d3.namespaces" do
    expect(D3.namespaces).to eq({
      "svg"=>"http://www.w3.org/2000/svg",
      "xhtml"=>"http://www.w3.org/1999/xhtml",
      "xlink"=>"http://www.w3.org/1999/xlink",
      "xml"=>"http://www.w3.org/XML/1998/namespace",
      "xmlns"=>"http://www.w3.org/2000/xmlns/"
    })
  end
end
