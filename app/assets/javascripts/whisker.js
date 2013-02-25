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
dataMap = {
  0 : "assists", 
  1 : "blocks", 
  2 : "field_goal_percentage", 
  3 : "free_throw_percentage", 
  4 : "rebounds", 
  5 : "steals", 
  6 : "three_pointers_made", 
  7 : "total_points", 
  8 : "turnovers"
}


function loadBoxAndWhisker(externalData)
{
  var category_index = 0;

  // externalData.forEach(function(week) {

  //   for(var category_index = 0; category_index < 1 ; category_index++ )
  //   {
  //     category = dataMap[category_index];
  //     //console.debug(category); 
  //     console.debug(week[category]);
  //     stat = week[category];
  //     var d = data[category];

  //     /// If the array for this stat is null, create an array at this index with value stat. 
  //     /// If data[category] already contains some values, add to it. 
  //     if(!d) d = data[category] = [stat];
  //     else d.push(stat);
  //   }
  // });

  // chart.domain([min, max]);  


  var svg = d3.select("#box_plot").selectAll("svg")
      .data(externalData)
      // .data([[1,2,2,3,4,6,5,4,2]])
      .enter().append("svg")
      .attr("class", "box")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.bottom + margin.top)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .call(chart);

      setInterval(function() {
        svg.datum(randomize).call(chart.duration(1000));
      }, 2000);
}

function randomize(d) {
  if (!d.randomizer) d.randomizer = randomizer(d);
  return d.map(d.randomizer);
}

function randomizer(d) {
  var k = d3.max(d);
  return function(d) {
    return d;
  };
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