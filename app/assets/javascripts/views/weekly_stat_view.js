
var WeeklyStatView = null; 
var WeeklyStatListView = null; 

function loadWeeklyStatViews() 
{
  /**********************************
  Single Weekly_Stat View 
  **********************************/
  WeeklyStatView = Backbone.View.extend({
    
    tagName: "tr",

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
  WeeklyStatListView = Backbone.View.extend({    

    el: $('#weekly_stat_list_placeholder'), // assumes this is a <table> tag.

    initialize: function()
    {
      _.bindAll(this); 
      this.el =  $('#weekly_stat_list_placeholder'); 
    },

    
    tableEl : null, 

    render: function()
    {
      this.tableEl = $('<table class="table table-striped table-hover table-condensed"><thead><tr><th data-sort="string">Team Name</th><th data-sort="float">FG %</th><th data-sort="float">FT %</th><th data-sort="int">3PM</th><th data-sort="int">Points</th><th data-sort="int">Rebounds</th><th data-sort="int">Assists</th><th data-sort="int">Steals</th><th data-sort="int">Blocks</th><th data-sort="int">TO</th></tr></table>');
      var tbodyEl = $('<tbody />')
      this.tableEl.append(tbodyEl);
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
        }
        this.$el.append(this.tableEl); 
        this.tableEl.stupidtable(); 
      }
      
    },

    getView: function(item)
    {
      return new WeeklyStatView({
        model: item, 
      });
    }, 

    clear: function() 
    {
      this.tableEl.remove();     
    }

  });
}
