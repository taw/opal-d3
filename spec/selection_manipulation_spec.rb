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
end
