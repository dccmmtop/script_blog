// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
$(document).on("turbolinks:load",function(){
  var window_height = window.outerHeight
  var container_height = parseInt($(".container").css("height").replace(/px/,""),10)
  console.log(window_height)
  console.log(container_height)
  if (window_height >= container_height)
  {
    $(".container").css("height",window_height-176+"px")
    console.log($(".container").css("height"))
  }
})
