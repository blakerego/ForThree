
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
	url: "/weekly_stats", 

	
	/// Check the constructor attributes for week_number. Use this to filter, if it exists. 
	initialize : function (attributes, options) 
	{	
    _.bindAll(this); 
		if (attributes.week_number != null)
		{
			this.url = "/weekly_stats?week_number=" + attributes.week_number; 
		}
	}

});

