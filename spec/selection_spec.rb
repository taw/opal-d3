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

  describe "nested selections" do
    before(:each) do
      D3.select("div").html("
        <p><b>1</b><b>2</b><b>3</b></p>
        <p><b>4</b><b>5</b><b>6</b></p>
      ")
    end

    it "selection.select" do
      expect(D3.select("p").select("b").size).to eq(1)
      expect(D3.select_all("p").select("b").size).to eq(2)
    end

    it "selection.select_all" do
      expect(D3.select("p").select_all("b").size).to eq(3)
      expect(D3.select_all("p").select_all("b").size).to eq(6)
    end
  end

  describe "selection.filter - selector string" do
    before(:each) do
      D3.select("div").html("
        <span class='a b'>1</span>
        <span class='b c'>2</span>
        <span class='c d'>3</span>
      ")
    end
    let(:a) { D3.select_all("span.a") }
    let(:b) { D3.select_all("span.b") }
    let(:c) { D3.select_all("span.c") }
    let(:d) { D3.select_all("span.d") }

    it do
      expect(b.filter(".c").size).to eq(1)
    end
  end

  describe "selection.filter - filter" do
    before(:each) do
      D3.select("div")
        .select_all("span")
        .data(%W[a b c d])
        .enter
        .append("span")
        .text{|d| d}
    end

    it "function" do
      D3.select_all("span").filter{|d| d =~ /[bc]/}.attr("class", "x")
      expect(D3.select("div").html).to eq(
        %Q[<span class="x">a</span><span>b</span><span>c</span><span class="x">d</span>]
      )
    end

    it "function with index" do
      D3.select_all("span").filter{|d,i| i.even?}.attr("class", "y")
      expect(D3.select("div").html).to eq(
        %Q[<span class="y">a</span><span>b</span><span class="y">c</span><span>d</span>]
      )
    end
  end

  describe "selection.each" do
    before(:each) do
      D3.select("div")
        .select_all("span")
        .data(%W[a b c d])
        .enter
        .append("span")
        .text{|d| d}
    end
    it do
      results = []
      D3.select_all("span").each do |n|
        results << n
      end
      expect(results).to eq(["a", "b", "c", "d"])
    end

    it do
      results = []
      D3.select_all("span").each do |n,i|
        results << [n,i]
      end
      expect(results).to eq([["a", 0], ["b", 1], ["c", 2], ["d", 3]])
    end
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

  describe do
    before(:each) do
      D3.select("div").html("
        <p><b>1</b><b>2</b><b>3</b></p>
        <p><b>4</b><b>5</b><b>6</b></p>
      ")
    end

    # These should use opal-browser, but that seems to be broken with phantomjs
    # For now just expose raw js objects
    it "selection.node" do
      expect(D3.select_all("b").node).to be_instance_of(Native::Object)
    end

    it "selection.nodes" do
      expect(D3.select_all("b").nodes).to be_instance_of(Array)
      D3.select_all("b").nodes.each do |n|
        expect(n).to be_instance_of(Native::Object)
      end
    end
  end
end

__END__

# A lot of them have multiple interfaces, don't mark as done until sure

d3.selection - select the root document element.
d3.matcher - test whether an element matches a selector.
d3.selector - select an element.
d3.selectorAll - select elements.
d3.window - get a node’s owner window.
selection.merge - merge this selection with another.

selection.on - add or remove event listeners.
selection.dispatch - dispatch a custom event.
d3.event - the current user event, during interaction.
d3.customEvent - temporarily define a custom event.
d3.mouse - get the mouse position relative to a given container.
d3.touch - get a touch position relative to a given container.
d3.touches - get the touch positions relative to a given container.

selection.call - call a function with this selection.

d3.local - declares a new local variable.
local.set - set a local variable’s value.
local.get - get a local variable’s value.
local.remove - delete a local variable.
local.toString - get the property identifier of a local variable.
