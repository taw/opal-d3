require "opal"
require "opal-d3"

data_array = [5,11,18]

svg = D3.select("body")
        .append("svg")
        .attr("height", "400px")
        .attr("width", "100%")

svg.select_all("rect")
   .data(data_array)
   .enter().append("rect")
     .attr("x"){|d,i| 60*i+20 }
     .attr("y"){|d| 300-d*15 }
     .attr("width", "50")
     .attr("height"){|d| d*15 }
     .attr("fill", "pink")
