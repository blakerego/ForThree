

var w = new WeeklyStatList(); 
w.fetch({
	error: function()
	{
		alert('an error has occurred.');
	},

	success: function()
	{
		//alert(w.models.length);
		
		
		var view = new WeeklyStatListView({
			collection : w
		});
		view.render();

	}
}); 
