require "opal-d3"
require "data/london_population"

svg = D3.select("#visualization").append("svg")

format_tooltip = proc do |d|
  "%d - %.1fm / %.1fm" % [d.year, d.inner/1_000_000, d.greater/1_000_000]
end

svg.append("g").select_all("rect")
   .data(LondonPopulation).enter()
   .append("rect")
     .attr("class", "greater")
     .attr("width", 30)
     .attr("height"){|d| d.greater/100_000 }
     .attr("y"){|d| 200 - d.greater/100_000 }
     .attr("x"){|d| (d.year-1800)*4 }
     .append("title").text(&format_tooltip)

svg.append("g").select_all("rect")
  .data(LondonPopulation).enter()
  .append("rect")
    .attr("class", "inner")
    .attr("width", 30)
    .attr("height"){|d| d.inner/100_000 }
    .attr("y"){|d| 200 - d.inner/100_000 }
    .attr("x"){|d| (d.year-1800)*4 }
    .append("title").text(&format_tooltip)

svg.append("g").select_all("circle")
   .data(LondonPopulation).enter()
   .append("circle")
     .attr("class", "greater")
     .attr("cx"){|d| 15 + (d.year-1800)*4 }
     .attr("cy", 300)
     .attr("r"){|d| (d.greater**0.5)/150.0 }
     .append("title").text(&format_tooltip)

svg.append("g").select_all("circle")
  .data(LondonPopulation).enter()
  .append("circle")
    .attr("class", "inner")
    .attr("cx"){|d| 15 + (d.year-1800)*4 }
    .attr("cy", 300)
    .attr("r"){|d| (d.inner**0.5)/150.0 }
    .append("title").text(&format_tooltip)

legend = D3.select("#visualization").append("div").attr("id", "legend")
legend.append("tr").append("td").attr("class", "greater").text("Outer London")
legend.append("tr").append("td").attr("class", "inner").text("Inner London")
