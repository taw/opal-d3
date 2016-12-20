require "opal"
require "opal-d3"
require "data/elections_2016"

list = D3.select("#visualization").append("ul")

Elections2016.each do |candidate|
  item = list.append("li")
  item.text = "#{candidate[:name]} - #{candidate[:votes]} votes"
  item.style("background-color", candidate[:color])
end
