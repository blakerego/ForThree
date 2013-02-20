

var currentMode = assists_mode; 

var assistsData = null; 
var blocksData = null; 
var pointsData = null; 
var fgpData = null; 
var ftpData = null; 
var stealsData = null; 
var reboundsData = null; 
var turnoversData = null; 
var tpmData = null; 

$('.btn-stat').click(function(event)
{
  if(currentMode != event.target.id)
  {
    $('#teamStatRow').empty();
    
    currentMode = event.target.id; 
    if (currentMode == 'assists_mode')
    {
      graph(assistsData, 'Assists'); 
    }
    else if (currentMode == 'rebounds_mode')
    {
      graph(reboundsData, 'Rebounds');
    }
    else if (currentMode == 'blocks_mode')
    {
      graph(blocksData, 'Blocks');
    }
    else if (currentMode == 'points_mode')
    {
      graph(pointsData, 'Points'); 
    }
    else if (currentMode == 'fg_p_mode')
    {
      graph(fgpData, 'FG%');
    }
    else if (currentMode == 'ft_p_mode')
    {
      graph(ftpData, "FT%"); 
    }
    else if (currentMode == 'steals_mode')
    {
      graph(stealsData, 'Steals'); 
    }
    else if (currentMode == 'rebounds_mode')
    {
      graph(reboundsData, 'Rebounds'); 
    }
    else if (currentMode == 'turnovers_mode') 
    {
      graph(turnoversData, 'Turnovers');
    }
    else if (currentMode == '3pm_mode')
    {
      graph(tpmData, 'Three Pointers Made');
    }
  }
});

function setAssists(data)
{
  assistsData = data;
}

function setBlocks(data)
{
  blocksData = data; 
}

function setPoints(data)
{
  pointsData = data;
}

function setFGP(data)
{
  fgpData = data;
}

function setFTP(data)
{
  ftpData = data;
}

function setSteals(data)
{
  stealsData = data; 
}

function setRebounds(data) 
{
  reboundsData = data; 
}

function  setTurnovers(data) 
{
  turnoversData = data; 
}

function set3PM(data) 
{
  tpmData = data;
}