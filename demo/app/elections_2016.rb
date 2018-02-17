require "opal-d3"
require "data/elections_2016"

list = D3.select("#visualization").append("ul")
max_votes = Elections2016.map(&:votes).max

Elections2016.each do |candidate|
  vote_count_formatted = D3.format("3,d").(candidate.votes)
  item = list.append("li")
    .style("position", "relative")
  item.append("span")
    .style("background-color", candidate.color)
    .style("opacity", 0.5)
    .style("position", "absolute")
    .style("width", "#{100.0 * candidate.votes / max_votes}%")
    .style("height", "100%")
  item.append("span")
    .style("position", "absolute")
    .text("#{candidate.name} - #{vote_count_formatted} votes")
end
