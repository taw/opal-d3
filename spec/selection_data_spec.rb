describe "d3 - selection - data" do
  after(:each) do
    D3.select("#test-area").html("")
  end
  let(:root) { D3.select("#test-area") }
  let(:html) { root.html }

  describe "list" do
    let(:data) {[
      {name: "A", value: 10},
      {name: "B", value: 20},
      {name: "C", value: 30},
    ]}
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
  end

  describe "matrix" do
    let(:data) {
      [
        [11975,  5871, 8916, 2868],
        [ 1951, 10048, 2060, 6171],
        [ 8010, 16145, 8090, 8045],
        [ 1013,   990,  940, 6907],
      ]
    }
    it do
      tr = root
        .append("table")
        .select_all("tr")
        .data(data)
        .enter
        .append("tr")
      tr.select_all("td")
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
end

__END__

.data key

selection.exit - get the exit selection (elements missing data).
selection.datum - get or set element data (without joining).
