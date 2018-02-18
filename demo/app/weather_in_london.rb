require "opal-d3"
require "data/weather_in_london"

row = D3.select("#visualization").append("div").attr("class", "row")

min_temp = WeatherInLondon.map(&:min).min
max_temp = WeatherInLondon.map(&:max).max

x = D3.scale_linear.domain([1,31]).range([30, 190])
y = D3.scale_linear.domain([min_temp, max_temp]).range([180, 20])

(1..12).each do |month|
  header = D3.time_format("%B").(Time.parse("2016-#{month}-01"))
  panel = row.append("div").attr("class", "col-xs-6 col-sm-4")
  panel.append("h3").text(header)
  svg = panel.append("svg")
    .attr("height", "200px")
    .attr("width", "200px")

  svg.append("rect")
    .attr("x", 20)
    .attr("y", 10)
    .attr("width", 180)
    .attr("height", 180)
    .attr("fill", "lightgrey")

  data = WeatherInLondon.select{|row_data| row_data.month == month}

  max_temp = D3.line
    .x{|d| x.(d.day) }
    .y{|d| y.(d.max) }
    .curve(D3.curve_natural)
  svg.append("path")
    .attr("d", max_temp.(data))
    .attr("stroke", "red")
    .attr("stroke-width", "2px")
    .attr("fill", "none")

  mean_temp = D3.line
    .x{|d| x.(d.day) }
    .y{|d| y.(d.mean) }
    .curve(D3.curve_natural)
  svg.append("path")
    .attr("d", mean_temp.(data))
    .attr("stroke", "black")
    .attr("stroke-width", "2px")
    .attr("fill", "none")

  min_temp = D3.line
    .x{|d| x.(d.day) }
    .y{|d| y.(d.min) }
    .curve(D3.curve_natural)
  svg.append("path")
    .attr("d", min_temp.(data))
    .attr("stroke", "blue")
    .attr("stroke-width", "2px")
    .attr("fill", "none")

  axis_left = D3.axis_left(y).tick_size(2)
  svg.append("g").attr("transform", "translate(20,0)").call(axis_left)
end
