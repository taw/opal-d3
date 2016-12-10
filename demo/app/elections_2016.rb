require "opal"
require "opal-d3"

data = [
  { name: "Donald Trump", votes: 62686675, color: "#ff8c00" },
  { name: "Hillary Clinton", votes: 65240114, color: "#98abc5" },
  { name: "Gary Johnson", votes: 4460666, color: "#8a89a6" },
  { name: "Jill Stein", votes: 1440193, color: "#7b6888" },
  { name: "Evan McMullin", votes: 642386, color: "#6b486b" },
  { name: "Darrell Castle", votes: 198576, color: "#a05d56" },
]

list = D3.select("#visualization").append("ul")

data.each do |candidate|
  item = list.append("li")
  item.text = "#{candidate[:name]} - #{candidate[:votes]} votes"
  item.style("background-color", candidate[:color])
end
