
var view = null;
var i = 0; 
var j = 0; 

var renderPage = function()
{
	i++; 
	console.log("number of renders: " + i); 
	view = null;
	var w = new WeeklyStatList( {
		week_number : $('#week_number').val()
		}); 
	w.fetch({
		error: function()
		{
			alert('an error has occurred.');
		},

		success: function()
		{
			j++; 
			console.log("number of successes: " + j); 
			view = new WeeklyStatListView({
				collection : w
			});
			view.render();

		}
	}); 
}

$('#add_research_button').click(function()
{
	var rawData = $('#research_input').val();
	var array = rawData.split('\t');
	var ws = new WeeklyStat({
		field_goal_percentage : array[1],
		free_throw_percentage : array[2], 
		three_pointers_made : array[3], 
		total_points : array[4], 
		rebounds : array[5], 
		assists : array[6], 
		steals : array[7], 
		blocks : array[8], 
		turnovers : array[9], 
		week_number : $('#week_number').val(),
		
		team : new Team({ 
			name : array[0] 
		})
	});

	ws.save(); 
	view.clear(); 
	renderPage(); 
});

