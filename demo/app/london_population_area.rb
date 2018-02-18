require "opal-d3"
require "data/london_population"

svg = D3.select("#visualization").append("svg")
width = svg.style("width").to_i

x = D3.scale_linear.domain([1801, 2011]).range([0, width-60])
y = D3.scale_linear.domain([0, 9_000_000]).range([400, 0])

greater_area = D3.area
  .x{|d| x.(d.year) }
  .y0(400)
  .y1{|d| y.(d.greater)}
  .curve(D3.curve_natural)

inner_area = D3.area
  .x{|d| x.(d.year) }
  .y0(400)
  .y1{|d| y.(d.inner)}
  .curve(D3.curve_natural)

graph_area = svg.append("g")
  .attr("transform", "translate(60, 20)")
graph_area.append("path")
  .attr("d", greater_area.(LondonPopulation))
  .attr("fill", "pink")
graph_area.append("path")
  .attr("d", inner_area.(LondonPopulation))
  .attr("fill", "steelblue")

axis_left = D3.axis_left(y).tick_format{|d| "#{d/1_000_000}M"}
graph_area.call(axis_left)

axis_bottom = D3.axis_bottom(x).tick_format(D3.format("d"))
graph_area.append("g").attr("transform", "translate(0, 400)").call(axis_bottom)

legend = D3.select("#visualization").append("div").attr("id", "legend")
legend.append("tr").append("td").attr("class", "greater").text("Outer London")
legend.append("tr").append("td").attr("class", "inner").text("Inner London")
