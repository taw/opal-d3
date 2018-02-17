require "opal-d3"
require "data/iphones"

svg = D3.select("#visualization")
  .append("svg")
  .attr("height", "500px")
  .attr("width", "100%")
width = svg.style("width").to_i

x = D3.scale_linear.domain(IPhoneVariants.map(&:released).minmax).range([20,width-90]).nice
y = D3.scale_log.domain(IPhoneVariants.map(&:size).minmax).range([380,20])
c = D3.scale_ordinal.range(D3.scheme_category_20)

# If there are multiple points on same date/size combination,
# move any duplicates 15px right (or 30px for triplicates etc.)
duplicates = Hash.new(0)

graph_area = svg.append("g")
  .attr("transform", "translate(60, 20)")
graph_area.select_all("circle")
  .data(IPhoneVariants).enter
  .append("circle")
    .attr("cx"){|d|
      count = duplicates[[d.released, d.size]]
      duplicates[[d.released, d.size]] += 1
      x.(d.released) + 15 * count
    }
    .attr("cy"){|d| y.(d.size) }
    .attr("r", 10)
    .attr("fill"){|d| c.(d.name) }
    .append("title")
      .text{|d| "#{d.name} - #{d.size}GB" }

axis_left = D3.axis_left(y)
  .tick_values([4,8,16,32,64,128,256])
  .tick_format{|v| "#{v} GB" }
graph_area.call(axis_left)

axis_bottom = D3.axis_bottom(x)
  .tick_format(D3.time_format("%Y-%m-%d"))
graph_area.append("g")
  .attr("transform", "translate(0, 400)")
  .call(axis_bottom)

D3.select("#visualization")
  .append("div")
  .style("display", "flex")
  .select_all("div")
  .data(IPhones).enter
    .append("div")
    .text{|d| d.name }
    .style("background"){|d| c.(d.name) }
    .style("padding", "0.5em")
    .style("margin", "0.5em")
