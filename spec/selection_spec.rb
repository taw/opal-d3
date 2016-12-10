describe "d3 - selection" do
  after(:each) do
    D3.select("#test-area").html("")
  end

  it "d3.selection" do
    s = D3.selection
    expect(s).to be_instance_of(D3::Selection)
    expect(s.size).to eq(1)
  end

  it "d3.select" do
    s = D3.select("div")
    expect(s).to be_instance_of(D3::Selection)
    expect(s.size).to eq(1)
    expect(s.empty?).to eq(false)

    s = D3.select("h6")
    expect(s).to be_instance_of(D3::Selection)
    expect(s.size).to eq(0)
    expect(s.empty?).to eq(true)
  end

  it "d3.select_all" do
    s = D3.select_all("div")
    expect(s).to be_instance_of(D3::Selection)
    expect(s.size).to eq(1)
    expect(s.empty?).to eq(false)

    s = D3.select_all("h6")
    expect(s).to be_instance_of(D3::Selection)
    expect(s.size).to eq(0)
    expect(s.empty?).to eq(true)
  end

  it "selection.append" do
    div = D3.select_all("div")
    ul = div.append("ul")
    ul.append("li")
    ul.append("li")
    expect(div.html).to eq("<ul><li></li><li></li></ul>")
    ul.select_all("li").text = "WOW"
    expect(div.html).to eq("<ul><li>WOW</li><li>WOW</li></ul>")
  end

  it "selection.html / selection.text" do
    div = D3.select_all("div")
    expect(div.html).to eq("")
    expect(div.text).to eq("")

    div.html = "<h1>Hello, World!</h1>"
    expect(div.html).to eq("<h1>Hello, World!</h1>")
    expect(div.text).to eq("Hello, World!")

    h1 = div.select("h1")
    expect(h1.text).to eq("Hello, World!")
    h1.text = "Goodbye, World!"
    expect(div.html).to eq("<h1>Goodbye, World!</h1>")
    expect(div.text).to eq("Goodbye, World!")
    expect(h1.html).to eq("Goodbye, World!")
    expect(h1.text).to eq("Goodbye, World!")
  end
end
