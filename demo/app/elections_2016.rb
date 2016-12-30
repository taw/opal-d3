require "opal"
require "opal-d3"
require "data/elections_2016"

list = D3.select("#visualization").append("ul")
max_votes = Elections2016.map(&:votes).max

Elections2016.each do |candidate|
  item = list.append("li")
    .style("position", "relative")
  item.append("span")
    .style("background-color", candidate.color)
    .style("position", "absolute")
    .style("width", "#{100.0 * candidate.votes / max_votes}%")
    .style("height", "100%")
  item.append("span")
    .style("position", "absolute")
    .text("#{candidate.name} - #{candidate.votes} votes")
end
