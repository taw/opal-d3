# Inspired by freecodecamp project
# This visualization really stretches what opal-d3 can currently comfortably do
# The code will hopefully become nicer in future versions of the gem
require "opal-d3"
require "json"
require "time"

url = "https://raw.githubusercontent.com/freeCodeCamp/ProjectReferenceData/master/GDP-data.json"

D3.json(url) do |error, response|
  # This interface could surely be better
  response = JSON.parse(`JSON.stringify(response)`)
  data = response["data"]

  visualization = D3.select("#visualization")
  svg = visualization.append("svg")
  width = svg.style("width").to_i

  xdomain = D3.extent(data){|x,y| Time.parse(x) }
  ydomain = [0, D3.max(data){|x,y| y }]

  xscale = D3.scale_time.domain(xdomain).range([50, width-10])
  yscale = D3.scale_linear.domain(ydomain).range([450, 10])
  xaxis = D3.axis_bottom(xscale)
  yaxis = D3.axis_left(yscale)

  tooltip = visualization.append("div").attr("id", "tooltip")
    .style("opacity", 0)

  D3.select("svg").append("g").attr("id","x-axis").call(xaxis)
  D3.select("svg").append("g").attr("id","y-axis").call(yaxis)

  # This array should get automatically unpacked
  D3.select("svg").select_all("rect")
    .data(data).enter
    .append("rect").attr("class", "bar")
    .attr("x"){|(x,y)| xscale.(Time.parse(x)) }
    .attr("y"){|(x,y)| yscale.(y) }
    .attr("width", 2)
    .attr("height"){|(x,y)| 450 - yscale.(y) }
    .on("mouseover"){|(x,y)|
      tooltip
        .style("opacity", 0.8)
      tooltip.html("#{x} <br/> #{y}")
        .style("left", "#{`d3.event.pageX`}px")
        .style("top", "#{`d3.event.pageY` - 28}px")
    }
    .on("mouseout"){
      # This could use .transition.duration(500), but opal-d3 doesn't support that yet
      tooltip
        .style("opacity", 0)
    }
end
