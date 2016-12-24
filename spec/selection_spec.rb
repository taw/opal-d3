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

  it "selection.attr / selection.style" do
    d = D3.select_all("div")
    d.append("p").attr("class", "big").style("color", "red")
    expect(d.html).to eq(%Q[<p class="big" style="color: red;"></p>])

    p = d.select_all("p")
    expect(p.attr("class")).to eq("big")
    expect(p.style("color")).to eq("rgb(255, 0, 0)")
  end

  describe "data" do
    let(:data) {[
      {name: "A", value: 10},
      {name: "B", value: 20},
      {name: "C", value: 30},
    ]}
    let(:root) { D3.select("div") }
    let(:html) { root.html }
    it "enter" do
      root
        .append("ul")
        .select_all("li")
        .data(data)
        .enter
        .append("li")
        .html{|d| "<b>#{d[:name]}</b>"}
        .style("font-size"){|d| "#{d[:value]}px"}
      expect(html).to eq([
        %Q[<ul>],
        %Q[<li style="font-size: 10px;"><b>A</b></li>],
        %Q[<li style="font-size: 20px;"><b>B</b></li>],
        %Q[<li style="font-size: 30px;"><b>C</b></li>],
        %Q[</ul>],
      ].join)
    end

    it "matrix" do
      matrix = [
        [11975,  5871, 8916, 2868],
        [ 1951, 10048, 2060, 6171],
        [ 8010, 16145, 8090, 8045],
        [ 1013,   990,  940, 6907],
      ]
      tr = root
        .append("table")
        .select_all("tr")
        .data(matrix)
        .enter
        .append("tr")
      td = tr.select_all("td")
        .data{|d| d}
        .enter
        .append("td")
        .text{|d| d}
      expect(html).to eq([
        %Q[<table>],
        %Q[<tr><td>11975</td><td>5871</td><td>8916</td><td>2868</td></tr>],
        %Q[<tr><td>1951</td><td>10048</td><td>2060</td><td>6171</td></tr>],
        %Q[<tr><td>8010</td><td>16145</td><td>8090</td><td>8045</td></tr>],
        %Q[<tr><td>1013</td><td>990</td><td>940</td><td>6907</td></tr>],
        %Q[</table>],
      ].join)
    end
  end

  it "svg" do
    D3.select("div")
      .append("svg")
        .attr("width", 960)
        .attr("height", 500)
      .append("g")
        .attr("transform", "translate(20,20)")
      .append("rect")
        .attr("width", 920)
        .attr("height", 460)
    expect(D3.select("div").html).to eq(
      %Q[<svg width="960" height="500"><g transform="translate(20,20)"><rect width="920" height="460"></rect></g></svg>])
  end
end
