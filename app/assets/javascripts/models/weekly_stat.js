
/************************************************************************
MODEL
*************************************************************************/

var WeeklyStat = Backbone.Model.extend({
	urlRoot: "/weekly_stats", 

	initialize: function() {
		this.set({ 'team' : new Team(this.get('team')) })
	},
	parse: function(data) {
		return data; 
	}
});

/************************************************************************
Collection
*************************************************************************/
var WeeklyStatList = Backbone.Collection.extend({
	model: WeeklyStat,
	url: "/weekly_stats"
});

