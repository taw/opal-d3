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

    it "selection.raise" do
      D3.select(".c").raise
      expect(html.scan(/class="(.)"/)).to eq([["a"], ["b"], ["d"], ["e"], ["c"]])
    end

    it "selection.lower" do
      D3.select(".c").lower
      expect(html.scan(/class="(.)"/)).to eq([["c"], ["a"], ["b"], ["d"], ["e"]])
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
