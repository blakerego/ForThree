

var w = new WeeklyStatList(); 
w.fetch({
	error: function()
	{
		alert('an error has occurred.');
	},

	success: function()
	{
		var view = new WeeklyStatListView({
			collection : w
		});
		view.render();

	}
}); 


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
		
		team : new Team({ 
			name : array[0] 
		})
	});

	ws.save(); 

});