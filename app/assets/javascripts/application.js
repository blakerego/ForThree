//= require jquery
//= require jquery_ujs

//= require bootstrap

//= require underscore
//= require backbone

//= require stupidtable.min

//= require application


//= require_tree .//models
//= require_tree .//views

//= require_tree .//static
//= require weeks
//= require d3.v3.min
//= require barGraph
//= require teams

//= require box

_.templateSettings = {
    interpolate: /\[\[\=(.+?)\]\]/g,
    evaluate: /\[\[(.+?)\]\]/g
};
