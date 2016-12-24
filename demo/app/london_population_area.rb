require "opal"
require "opal-d3"
require "data/london_population"

svg = D3.select("#visualization")
        .append("svg")
        .attr("height", "400px")
        .attr("width", "100%")

x = D3.scale_linear.domain([1801, 2011]).range([0, svg.style("width").to_i])
y = D3.scale_linear.domain([0, 9_000_000]).range([0, 400])

greater_area = D3.area
            .x{|d| x.(d[:year]) }
            .y0(400)
            .y1{|d| 400 - y.(d[:greater])}
            .curve(D3.curve_natural)

inner_area = D3.area
            .x{|d| x.(d[:year]) }
            .y0(400)
            .y1{|d| 400 - y.(d[:inner])}
            .curve(D3.curve_natural)

svg.append("path")
    .attr("d", greater_area.(LondonPopulation))
    .attr("fill", "pink")
svg.append("path")
    .attr("d", inner_area.(LondonPopulation))
    .attr("fill", "steelblue")
