
/************************************************************************
MODEL
*************************************************************************/

var WeeklyStat = Backbone.Model.extend({
	urlRoot: "/weekly_stats", 

	initialize: function() {
		this.set({ 'team' : new Team(this.get('team')) })
	},
	parse: function(data) {
		//alert(Object.keys(data));
		//alert(data.team.name);
 
		//this.set({ 'team' : new new Team(data.team) }); 
		return data; 
	}
})

/************************************************************************
Collection
*************************************************************************/
var WeeklyStatList = Backbone.Collection.extend({
	model: WeeklyStat,
	url: "/weekly_stats"
})

var w = new WeeklyStatList(); 
w.fetch({
	error: function()
	{
		alert('an error has occurred.');
	},

	success: function()
	{
		alert(w.models.length); 
	}
}); 

