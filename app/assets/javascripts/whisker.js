var availableColors = [

]

var margin = {top: 10, right: 50, bottom: 20, left: 50},
    width = 120 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var min = Infinity,
    max = -Infinity;

// var chart = d3.box()
//     .whiskers(iqr(1.5))
//     .width(width)
//     .height(height);

var data = [];


// What the data looks like: {"assists":68,"blocks":25,"field_goal_percentage":0.517,"free_throw_percentage":0.702,"id":6,"rebounds":134,"steals":22,"team_id":1,"three_pointers_made":37,"total_points":327,"turnovers":49,"week_number":14}


var boxPlotSvg = null; 
var allData = null; 
function loadBoxAndWhisker(externalData, dataMap)
{
  allData = externalData;
  var category_index = 0;

  for (var i = 0; i < externalData.length; i++)
  {
    data = [externalData[i]];
    var chart = d3.box()
        .whiskers(iqr(1.5))
        .width(width)
        .height(height);

    var subDiv = "box_plot_" + i;
    $('#box_plot').append('<div id="' + subDiv + '"><h2>'+ dataMap[i] + '</h2></div>')

    boxPlotSvg = d3.select('#' + subDiv).selectAll("svg")
        .data(data)
        .enter().append("svg")
        .attr("class", "box")
        .attr("id", subDiv)
        .attr("height", width + margin.left + margin.right)
        .attr("width", height + margin.bottom + margin.top)
        .append("g")
        .call(chart)
        .attr("transform", "rotate(90 220 260)")
        .append("text")
        .attr("y", -20)
        .attr("x", -height )
        .attr("transform", "rotate(-90)")
        .attr("class", "category_headers")
        ;
  }


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

var TeamNames = null; 
function loadCheckboxes(teamNames)
{
  TeamNames = teamNames;
  for(var i = 0; i<teamNames.length; i++)
  {
    $('#team_name_checkboxes').append('<br/><li class="team_li" id="li_' + i + '" ><a id="' + i + '" value="' + i + '" href="#">' + teamNames[i] + '</a></li></type>');    
  }
}

function teamClickHandler(event)
{
  elementId = event.target.id;
  a_element = $('#'+ elementId);
  var value = a_element.attr('value');

  li_element = $('#li_'+ elementId);
  
  if (stringContains(li_element[0].className, 'active'))
  {
    // Already active. Deactivate. 
    li_element.removeClass('active');    
  } 
  else 
  {
    // Activate now. 
    li_element.addClass('active');  
    drawCirclesForTeam(value); 
  }

}

function drawCirclesForTeam(value) 
{
  var team = TeamNames[value];
  console.debug(team);

  for(var i = 0; i < allData.length; i++)
  {
    var currentDataList = allData[i];
    var statValue = currentDataList[value];
    console.debug(statValue);
    var subDiv = '#box_plot_' + i; 
    d3.select(subDiv).selectAll("svg").selectAll("g")
      .append('circle')
      .attr('cx', 10)
      .attr('cy', x1Map[i](statValue))
      .attr('r',8)
      .style("fill", availableColors[value])      
      ;  
  }
}

function stringContains(s, subString)
{
  return s.indexOf(subString) !== -1  
}


var availableColors = ["LightSteelBlue","LightYellow","Lime","LimeGreen","Linen","Magenta","Maroon","MediumAquaMarine","MediumBlue","MediumOrchid","MediumPurple","MediumSeaGreen","MediumSlateBlue","MediumSpringGreen","MediumTurquoise","MediumVioletRed","MidnightBlue","MintCream","MistyRose","Moccasin","NavajoWhite","Navy","OldLace","Olive","OliveDrab","Orange","OrangeRed","Orchid","PaleGoldenRod","PaleGreen","PaleTurquoise","PaleVioletRed","PapayaWhip","PeachPuff","Peru","Pink","Plum","PowderBlue","Purple","Red","RosyBrown","RoyalBlue","SaddleBrown","Salmon","SandyBrown","SeaGreen","SeaShell","Sienna","Silver","SkyBlue","SlateBlue","SlateGray","SlateGrey","Snow","SpringGreen","SteelBlue","Tan","Teal","Thistle","Tomato","Turquoise","Violet","Wheat","White","WhiteSmoke","Yellow"]