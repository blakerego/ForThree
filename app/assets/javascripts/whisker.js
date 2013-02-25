var margin = {top: 10, right: 50, bottom: 20, left: 50},
    width = 120 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var min = Infinity,
    max = -Infinity;

var chart = d3.box()
    .whiskers(iqr(1.5))
    .width(width)
    .height(height);

var data = [];


// What the data looks like: {"assists":68,"blocks":25,"field_goal_percentage":0.517,"free_throw_percentage":0.702,"id":6,"rebounds":134,"steals":22,"team_id":1,"three_pointers_made":37,"total_points":327,"turnovers":49,"week_number":14}


function loadBoxAndWhisker(externalData, dataMap)
{
  var category_index = 0;

  var svg = d3.select("#box_plot").selectAll("svg")
      .data(externalData)
      .enter().append("svg")
      .attr("class", "box")
      // .attr("width", width + margin.left + margin.right)
      // .attr("height", height + margin.bottom + margin.top)
      .attr("height", width + margin.left + margin.right + 10)
      .attr("width", height + margin.bottom + margin.top)
      .append("g")
      // .attr("transform", "translate(" + margin.left + "," + margin.top + ")")


      .call(chart)
      .attr("transform", "rotate(90 220 260)")
      //.attr("transform", "translate(100)")
      .append("text")
      .attr("y", 10)
      .text(function(d,i)
        { 
          return dataMap[i]; 
        })
      ;


}


// Returns a function to compute the interquartile range.
function iqr(k) {
  return function(d, i) {
    var q1 = d.quartiles[0],
        q3 = d.quartiles[2],
        iqr = (q3 - q1) * k,
        i = -1,
        j = d.length;
    while (d[++i] < q1 - iqr);
    while (d[--j] > q3 + iqr);
    return [i, j];
  };
}