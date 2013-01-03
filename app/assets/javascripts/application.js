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


_.templateSettings = {
    interpolate: /\[\[\=(.+?)\]\]/g,
    evaluate: /\[\[(.+?)\]\]/g
};
