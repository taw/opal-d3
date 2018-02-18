require "opal-d3"
require "data/star_trek_voyager"

svg = D3.select("#visualization")
  .append("svg")
  .attr("height", "600px")
  .attr("width", "100%")
width = svg.style("width").to_i

x = D3.scale_linear.domain([0, StarTrekVoyager.size-1]).range([40, width-20])
y = D3.scale_linear.domain(StarTrekVoyager.map(&:rating).minmax).range([550, 50])
c = D3.scale_ordinal.range(D3.scheme_category_10)

(1..7).each do |season|
  episodes = StarTrekVoyager.select{|episode| episode.season == season }
  avg = D3.mean(episodes.map(&:rating))
  svg.append("line")
    .attr("x1", x.(episodes.map(&:number).min))
    .attr("x2", x.(episodes.map(&:number).max))
    .attr("y1", y.(avg))
    .attr("y2", y.(avg))
    .attr("stroke", c.(season))
    .attr("stroke-width", 2)
    .attr("opacity", 0.4)
end

StarTrekVoyager.each do |episode|
  svg.append("circle")
    .attr("cx", x.(episode.number))
    .attr("cy", y.(episode.rating))
    .attr("r", 4)
    .attr("fill", c.(episode.season))
    .attr("opacity", 0.6)
    .append("title")
      .text("S%02dE%02d %s" % [episode.season, episode.number, episode.title])
end

axis = D3.axis_left(y)
svg.append("g").attr("transform","translate(30, 0)")
  .call(axis)
