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

  el: $('#weekly_stat_list_placeholder'), // attaches `this.el` to an existing element.

  tagName: 'table', 

  class: 'table',

  initialize: function()
  {
    _.bindAll(this); 
    this.el =  $('#weekly_stat_list_placeholder'); 
  },

  render: function()
  {
    var tableEl = $('<table><thead><tr><th>Team Name</th><th>FG %</th><th>FT %</th><th>3PM</th><th>Points</th><th>Rebounds</th><th>Assists</th><th>Steals</th><th>Blocks</th><th>TO</th></tr></table>');
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
    }
    
  },

  getView: function(item)
  {
    return new WeeklyStatView({
      model: item, 
    });
  }

});
