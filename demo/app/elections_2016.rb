require "opal-d3"
require "data/elections_2016"

list = D3.select("#visualization").append("ul").attr("class", "results")
max_votes = Elections2016.map(&:votes).max

Elections2016.each do |candidate|
  vote_count_formatted = D3.format("3,d").(candidate.votes)
  item = list.append("li")
  item.append("span")
    .attr("class", "vote-bar")
    .style("background-color", candidate.color)
    .style("width", "#{100.0 * candidate.votes / max_votes}%")
  item.append("span")
    .attr("class", "vote-description")
    .text("#{candidate.name} - #{vote_count_formatted} votes")
end
