require "opal-d3"
require "data/mtg_modern_creatures"

svg = D3.select("#visualization")
  .append("svg")
  .attr("height", "600px")
  .attr("width", "600px")

# Use one scale not two so it's a square
min, max = MtgModernCreatures.flat_map{|c| [c.power, c.toughness]}.minmax

pt = D3.scale_linear.domain([min-1, max+1]).range([0, 580])
box_size = pt.(1) - pt.(0)
c = D3.scale_log
  .domain([1, MtgModernCreatures.map(&:count).max])
  .range(["rgb(128, 255, 128)", "rgb(128, 128, 255)"])

graph_area = svg.append("g").attr("transform", "translate(0,0)")

MtgModernCreatures.each do |cards|
  graph_area.append("rect")
    .attr("x", pt.(cards.toughness))
    .attr("y", pt.(cards.power))
    .attr("height", box_size)
    .attr("width", box_size)
    .attr("fill", c.(cards.count))
  graph_area.append("text")
    .attr("x", pt.(cards.toughness) + box_size/2)
    .attr("y", pt.(cards.power) + box_size/2 + 5)
    .attr("text-anchor", "middle")
    .text(cards.count)
end

(min..max).each do |v|
  graph_area.append("text")
    .attr("x", pt.(v) + box_size/2)
    .attr("y", pt.(min-1) + box_size/2 + 5)
    .attr("text-anchor", "middle")
    .text(v)

  graph_area.append("text")
    .attr("y", pt.(v) + box_size/2 + 5)
    .attr("x", pt.(min-1) + box_size/2)
    .attr("text-anchor", "middle")
    .text(v)
end

(min..max+1).each do |v|
  graph_area.append("line")
    .attr("x1", pt.(min))
    .attr("x2", pt.(max+1))
    .attr("y1", pt.(v))
    .attr("y2", pt.(v))
    .attr("stroke", "black")

  graph_area.append("line")
    .attr("y1", pt.(min))
    .attr("y2", pt.(max+1))
    .attr("x1", pt.(v))
    .attr("x2", pt.(v))
    .attr("stroke", "black")
end
