require "opal-d3"
require "data/olympics_2016_medals"

height = Olympics2016Medals.size * 24
svg = D3.select("#visualization")
  .append("svg")
  .attr("height", "#{height}px")
  .attr("width", "100%")

width = svg.style("width").to_i
max_medals = Olympics2016Medals.map(&:total).max

x = D3.scale_linear.domain([0, max_medals]).range([0, width-50])
y = D3.scale_linear.domain([0, Olympics2016Medals.size]).range([0, height])

chart_area = svg.append("g").attr("transform", "translate(50, 0)")

medal = chart_area.append("g")
  .select_all("g")
  .data(Olympics2016Medals)
  .enter.append("g")

medal.append("rect")
  .attr("height", 20)
  .attr("width"){|d| x.(d.gold) }
  .attr("x", 0)
  .attr("y"){|d,i| y.(i) }
  .attr("fill", "gold")

medal.append("text")
  .text{|d| d.gold == 0 ? "" : d.gold }
  .attr("x"){|d| x.(d.gold/2) }
  .attr("y"){|d,i| y.(i+0.7) }
  .style("text-anchor", "middle")

medal.append("rect")
  .attr("height", 20)
  .attr("width"){|d| x.(d.silver)}
  .attr("x"){|d| x.(d.gold) }
  .attr("y"){|d,i| y.(i) }
  .attr("fill", "silver")

medal.append("text")
  .text{|d| d.silver == 0 ? "" : d.silver }
  .attr("x"){|d| x.(d.gold + d.silver/2) }
  .attr("y"){|d,i| y.(i+0.7) }
  .style("text-anchor", "middle")

medal.append("rect")
  .attr("height", 20)
  .attr("width"){|d| x.(d.bronze) }
  .attr("x"){|d| x.(d.gold + d.silver) }
  .attr("y"){|d,i| y.(i) }
  .attr("fill", "#CD7F32")

medal.append("text")
  .text{|d| d.bronze == 0 ? "" : d.bronze}
  .attr("x"){|d| x.(d.gold + d.silver + d.bronze/2) }
  .attr("y"){|d,i| y.(i+0.7) }
  .style("text-anchor", "middle")

medal.append("text")
  .attr("x", -50)
  .attr("y"){|d,i| y.(i+0.7) }
  .text{|d| d.acronym }
  .style("font-size", "20px")
