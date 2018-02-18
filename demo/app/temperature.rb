# Inspired by freecodecamp project
# This visualization really stretches what opal-d3 can currently comfortably do
# The code will hopefully become nicer in future versions of the gem
require "opal-d3"
require "json"

url = "https://raw.githubusercontent.com/freeCodeCamp/ProjectReferenceData/master/global-temperature.json"
D3.json(url) do |err, response|
  response = JSON.parse(`JSON.stringify(response)`)
  base_temperature = response[:baseTemperature]
  data_points = response[:monthlyVariance]

  visualization = D3.select("#visualization")
  svg = visualization.append("svg")
  height = svg.style("height").to_i
  width = svg.style("width").to_i
  margin_left = 100
  margin_right = 50
  margin_top = 150
  margin_bottom = 150

  tooltip = visualization.append("div").attr("id", "tooltip")

  xmin, xmax = D3.extent(data_points){|d| d[:year] }
  tmin, tmax = D3.extent(data_points){|d| d[:variance] }

  xscale = D3.scale_linear
    .domain([xmin-0.5 , xmax+0.5])
    .range([margin_left, width-margin_right])
  yscale = D3.scale_linear
    .domain([0.5, 12+0.5])
    .range([margin_bottom, height-margin_top])

  tdomain = [tmin, tmin/2, 0, tmax/2, tmax]
  tscale = D3.scale_linear
    .range(["blue", "cyan", "green", "yellow", "red"])
    .domain(tdomain)
    .interpolate(&D3.interpolate_hcl)

  month_names = [
    "January", "February", "March",
    "April", "May", "June",
    "July", "August", "September",
    "October", "November", "December",
  ]

  xaxis = D3.axis_bottom(xscale)
    .tick_format(&D3.format("d"))
  svg.append("g").attr("id", "x-axis")
    .style("transform", "translate(0, #{height-margin_bottom}px)")
    .call(xaxis)

  yaxis = D3.axis_left(yscale)
    .tick_format{|d| month_names[d-1] }
  svg.append("g").attr("id", "y-axis")
    .style("transform", "translate(#{margin_left}px, 0)")
    .call(yaxis)

  svg.append("text").text("Historical Temperature Record")
    .attr("x", "#{width/2}px")
    .attr("y", "50px")
    .attr("id", "title")

  svg.append("text").text("#{xmin} - #{xmax}")
    .attr("x", "#{width/2}px")
    .attr("y", "100px")
    .attr("id", "description")

  legendscale = D3.scale_linear
    .domain([tmin, tmin/2, 0, tmax/2, tmax])
    .range([0, 40, 80, 120, 160])

  svg.append("g")
    .attr("id", "legend")
    .select_all("rect")
    .data(tdomain)
    .enter
    .append("rect")
    .attr("x"){|d,i| 100+40*i }
    .attr("y", height - 100)
    .attr("width", "40px")
    .attr("height", "40px")
    .style("border", "1px solid black")
    .style("fill"){|d| tscale.(d) }

  legendaxis = D3.axis_bottom(legendscale)

  svg.append("g")
    .style("transform", "translate(120px, #{height-50}px)")
    .call(legendaxis)

  svg.select_all("rect")
    .data(data_points)
    .enter
    .append("rect")
    .attr("class", "cell")
    .attr("x"){|d| xscale.(d[:year]-0.5) }
    .attr("y"){|d| yscale.(d[:month]-0.5) }
    .attr("height"){|d| yscale.(d[:month]+0.5) - yscale.(d[:month]-0.5) }
    .attr("width"){|d| xscale.(d[:year]+0.5) - xscale.(d[:year]-0.5) }
    .style("fill"){|d| tscale.(d[:variance]) }
    .on("mouseover"){|d|
      tooltip
        .style("display", "block")
        .style("left", "#{xscale.(d[:year])}px")
        .style("top", "#{yscale.(d[:month])}px")
        .html("#{month_names[d[:month]-1]} #{d[:year]}<br/>#{d[:variance]}")
    }
    .on("mouseout"){|d|
      tooltip
       .style("display", "none")
    }
end
