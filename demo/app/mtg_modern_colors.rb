require "opal-d3"
require "data/mtg_modern_colors"

flex = D3.select("#visualization")
  .append("div")
  .style("display", "flex")
  .style("flex-wrap", "wrap")

MtgModernColors.group_by(&:cmc).sort.each do |cmc, cards|
  svg = flex.append("svg")
    .attr("height", "200px")
    .attr("width", "200px")
  graph_area = svg
    .append("g")
    .attr("transform", "translate(100,100)")
  graph_area.append("text")
    .attr("text-anchor", "middle")
    .attr("y", 10)
    .text(cmc)
    .attr("font-size", "30px")

  cards.sort_by!{|c| "wubrgxm".index(c.color)}
  pie = D3.pie.value(&:count).sort(nil)

  pie.(cards).each do |arc_data|
    arc = D3.arc
      .inner_radius(40)
      .outer_radius(90)
      .start_angle(arc_data[:start_angle])
      .end_angle(arc_data[:end_angle])

    color = {
      w: "white",
      u: "blue",
      b: "black",
      r: "red",
      g: "green",
      x: "grey",
      m: "yellow",
    }[arc_data[:data].color]

    count = arc_data[:data].count
    label = "#{count} #{(count == 1) ? 'card' : 'cards'}"

    graph_area.append("path")
      .attr("d", arc.())
      .attr("fill", color)
      .attr("stroke", "black")
      .attr("stroke-width", "1px")
      .append("title")
        .text(label)
  end
end
