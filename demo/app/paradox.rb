require "opal-d3"
require "data/paradox"

svg = D3.select("#visualization")
  .append("svg")
  .attr("height", "600px")
  .attr("width", "100%")
width = svg.style("width").to_i

min_date, max_date = ParadoxGames.map(&:time).minmax
count = ParadoxGames.map{|g| [g.series, g.number]}.uniq.size
bar_height = 580 / count

x = D3.scale_linear.domain([min_date, max_date]).range([0,width-220])
y = D3.scale_ordinal.range(count.times.map{|i| bar_height * i})
c = D3.scale_ordinal.range(D3.scheme_category_10)
stripes = D3.scale_ordinal.range([0,1])

graph_area = svg.append("g")
  .attr("transform", "translate(200, 20)")

ParadoxGames.each do |game|
  dlc = (game.dlc != "")
  full_game = "#{game.series} #{game.number}"

  unless dlc
    graph_area.append("text")
      .attr("x", -200 + 5)
      .attr("y", y.(full_game) + 4)
      .text(full_game)

    color = D3.color(c.("#{game.series}"))
    color = color.brighter(stripes.("#{full_game}"))
    graph_area.append("rect")
      .attr("x", -200)
      .attr("width", width)
      .attr("y", y.(full_game) - bar_height/2)
      .attr("height", bar_height)
      .attr("fill", color)
      .attr("opacity", 0.2)
  end

  graph_area.append("circle")
    .attr("cx", x.(game.time))
    .attr("cy", y.(full_game))
    .attr("r", dlc ? 8 : 12)
    .attr("fill", c.("#{game.series}"))
    .attr("opacity", 0.6)
    .attr("stroke-width", "1px")
    .attr("stroke", "black")
    .append("title")
      .text("#{dlc ? game.dlc : full_game} - #{D3.time_format("%B %Y").(game.time)}")
end


axis_bottom = D3.axis_bottom(x)
  .tick_format(D3.time_format("%B %Y"))
graph_area.append("g").attr("transform", "translate(0, 560)").call(axis_bottom)
