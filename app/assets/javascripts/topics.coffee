# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $('#blog-content').append( marked(content))
$(this).on("turbolinks:load", ->
  $("table").addClass("table table-striped")
)
