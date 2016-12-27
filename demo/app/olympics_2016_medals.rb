require "opal"
require "opal-d3"
require "data/olympics_2016_medals"

height = Olympics2016Medals.size * 24
svg = D3.select("#visualization")
        .append("svg")
        .attr("height", "#{height}px")
        .attr("width", "100%")

width = svg.style("width").to_i
max_medals = Olympics2016Medals.map{|c,t,g,s,b| g+s+b}.max

x = D3.scale_linear.domain([0, max_medals]).range([0, width-50])
y = D3.scale_linear.domain([0, Olympics2016Medals.size]).range([0, height])

svg.append("g").attr("transform", "translate(50, 0)")
  .select_all("rect")
  .data(Olympics2016Medals)
  .enter.append("rect")
    .attr("height", 20)
    .attr("width"){|d| x.(d[2])}
    .attr("x", 0)
    .attr("y"){|d,i| y.(i)}
    .attr("fill", "gold")

svg.append("g").attr("transform", "translate(50, 0)")
  .select_all("rect")
  .data(Olympics2016Medals)
  .enter.append("rect")
    .attr("height", 20)
    .attr("width"){|d| x.(d[3])}
    .attr("x"){|d| x.(d[2]) }
    .attr("y"){|d,i| y.(i)}
    .attr("fill", "silver")

svg.append("g").attr("transform", "translate(50, 0)")
  .select_all("rect")
  .data(Olympics2016Medals)
  .enter.append("rect")
    .attr("height", 20)
    .attr("width"){|d| x.(d[4])}
    .attr("x"){|d| x.(d[2]) + x.(d[3]) }
    .attr("y"){|d,i| y.(i)}
    .attr("fill", "#CD7F32")

svg.append("g")
  .select_all("text")
  .data(Olympics2016Medals)
  .enter.append("text")
    .attr("x", 0)
    .attr("y"){|d,i| y.(i) + 16}
    .text{|d| d[1]}
    .style("font-size", "20px")
