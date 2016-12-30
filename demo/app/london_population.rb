require "opal"
require "opal-d3"
require "data/london_population"

svg = D3.select("#visualization")
        .append("svg")
        .attr("height", "400px")
        .attr("width", "100%")

svg.append("g").select_all("rect")
   .data(LondonPopulation)
   .enter().append("rect")
     .attr("width", 30)
     .attr("height"){|d| d.greater/100_000 }
     .attr("y"){|d| 200 - d.greater/100_000 }
     .attr("x"){|d| (d.year-1800)*4 }
     .attr("fill", "pink")

svg.append("g").select_all("rect")
  .data(LondonPopulation)
  .enter().append("rect")
    .attr("width", 30)
    .attr("height"){|d| d.inner/100_000 }
    .attr("y"){|d| 200 - d.inner/100_000 }
    .attr("x"){|d| (d.year-1800)*4 }
    .attr("fill", "steelblue")

svg.append("g").select_all("circle")
   .data(LondonPopulation)
   .enter().append("circle")
     .attr("fill", "pink")
     .attr("cx"){|d| 15 + (d.year-1800)*4 }
     .attr("cy", 300)
     .attr("r"){|d| (d.greater**0.5)/150.0 }

svg.append("g").select_all("circle")
  .data(LondonPopulation)
  .enter().append("circle")
    .attr("fill", "steelblue")
    .attr("cx"){|d| 15 + (d.year-1800)*4 }
    .attr("cy", 300)
    .attr("r"){|d| (d.inner**0.5)/150.0 }

list = D3.select("#visualization").append("table")
list.append("tr").append("td").text("Outer London").style("background", "pink")
list.append("tr").append("td").text("Inner London").style("background", "steelblue")
