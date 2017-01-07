describe "d3 - selection - DOM manipulation" do
  after(:each) do
    D3.select("#test-area").html("")
  end
  let(:root) { D3.select("div") }
  let(:html) { root.html }

  describe do
    before(:each) do
      D3.select("div")
        .select_all("span")
        .data(%W[a b c d e])
        .enter
        .append("span")
        .attr("class"){|d| d}
    end
    let(:classes) {
      html.scan(/<span.*?<\/span>/).map{|x| x[/class="([^"]*)"/, 1] || "" }
    }

    it "selection.raise" do
      D3.select(".c").raise
      expect(classes).to eq(["a", "b", "d", "e", "c"])
    end

    it "selection.lower" do
      D3.select(".c").lower
      expect(classes).to eq(["c", "a", "b", "d", "e"])
    end

    it "selection.classed - add" do
      D3.select_all("span").classed("a b", true)
      expect(classes).to eq(["a b", "b a", "c a b", "d a b", "e a b"])
    end

    it "selection.classed - remove" do
      D3.select_all("span").classed("a b", false)
      expect(classes).to eq(["", "", "c", "d", "e"])
    end

    it "selection.classed - function" do
      D3.select_all("span").classed("x"){|d,i| i.even?}
      expect(classes).to eq(["a x", "b", "c x", "d", "e x"])
    end

    it "selection.classed - query" do
      expect(D3.select(".c").classed("a")).to eq(false)
      expect(D3.select(".c").classed("c")).to eq(true)
      expect(D3.select(".c").classed("b c")).to eq(false)
    end
  end

  it "selection.attr / selection.style" do
    d = D3.select_all("div")
    d.append("p").attr("class", "big").style("color", "red")
    expect(d.html).to eq(%Q[<p class="big" style="color: red;"></p>])

    p = d.select_all("p")
    expect(p.attr("class")).to eq("big")
    expect(p.style("color")).to eq("rgb(255, 0, 0)")
  end
end
