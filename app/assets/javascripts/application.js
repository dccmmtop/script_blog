// This is a manifest file that'll be compiled into application.js, which will include all the files
//
// {}{}
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
$(document).on('turbolinks:load', function() {
  content = $('#blog-content').data('content');
  if (content) $('#blog-content').append(marked(content));
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
  $('table').addClass('table table-striped');
  document.onkeydown = KeyPress;
});
function KeyPress(){
  var key;
  key = KeyPress.arguments[0].keyCode;
  if(key == 83 && !$("#topic_search").hasClass("search-bar")){
    $("#topic_search").addClass("search-bar");
    $("#search-query").addClass("form-control");
    $("#search-query").val("");
    $("#search-query").focus();
    return false;
  }
  if (key == 27){
    $("#topic_search").removeClass("search-bar");
  }
}

