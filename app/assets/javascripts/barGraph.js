/*
Adapted from http://bl.ocks.org/mbostock/3885705
*/

var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;


var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1, 1);

var y = d3.scale.linear()
    .range([height, 0]);

var data = null;

var svg = null; 

var xAxis = null; 
var yAxis = null; 
function graph(externalData, yAxisLabel)
{
  data = externalData;


  xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom");

  yAxis = d3.svg.axis()
      .scale(y)
      .orient("left")
      //.tickFormat(formatPercent);

  svg = d3.select("#teamStatRow").append("svg")
      // .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


  data.forEach(function(d) {
    d.frequency = +d.value;
  });

  //alert(d); 

  x.domain(data.map(function(d) { return d.week_number; }));
  y.domain([0, d3.max(data, function(d) 
    { 
      //alert(d.value);
      return d.value; 
    })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text(yAxisLabel);

  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.week_number); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.value); })
      .attr("height", function(d) { return height - y(d.frequency); });

  d3.select("input").on("change", change);

}

function change() 
{
  clearTimeout(sortTimeout);

  // Copy-on-write since tweens are evaluated after a delay.
  var x0 = x.domain(data.sort(this.checked
      ? function(a, b) { return b.frequency - a.frequency; }
      : function(a, b) { return d3.ascending(a.week_number, b.value); })
      .map(function(d) { return d.week_number; }))
      .copy();

  var transition = svg.transition().duration(750),
      delay = function(d, i) { return i * 50; };

  transition.selectAll(".bar")
      .delay(delay)
      .attr("x", function(d) { return x0(d.week_number); });

  transition.select(".x.axis")
      .call(xAxis)
    .selectAll("g")
      .delay(delay);
}

