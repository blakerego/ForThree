/**********************************
Single Weekly_Stat View 
**********************************/
var WeeklyStatView = Backbone.View.extend({
  
  tagName: "tr",

  //className: "",

  template: _.template($('#weekly_stat_template').html()),

  initialize: function() 
  {
    _.bindAll(this); 
  },

  render: function() 
  {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});


/**********************************
List View
**********************************/
var WeeklyStatListView = Backbone.View.extend({    

  el: $('#weekly_stat_list_placeholder'), // assumes this is a <table> tag.

  initialize: function()
  {
    _.bindAll(this); 
    this.el =  $('#weekly_stat_list_placeholder'); 
  },

  render: function()
  {
    var tableEl = $('<table><thead><tr><th data-sort="string">Team Name</th><th data-sort="float">FG %</th><th data-sort="float">FT %</th><th data-sort="int">3PM</th><th data-sort="int">Points</th><th data-sort="int">Rebounds</th><th data-sort="int">Assists</th><th data-sort="int">Steals</th><th data-sort="int">Blocks</th><th data-sort="int">TO</th></tr></table>');
    var tbodyEl = $('<tbody />')
    tableEl.append(tbodyEl);
    if (typeof this.collection != 'undefined' )
    {

      var items = this.collection.models;
      var totalSize = items.length; 

      var current = 0;
      while (current < totalSize)
      {
        var row = new WeeklyStatView( { model: items[current++], el: $('<tr />') });
        row.render();
        tbodyEl.append(row.$el);
        //$(this.el).append(this.getView(items[current++]).render().el.outerHTML);   
      }
      this.$el.append(tableEl.children());
      this.$el.stupidtable(); 
    }
    
  },

  getView: function(item)
  {
    return new WeeklyStatView({
      model: item, 
    });
  }

});
