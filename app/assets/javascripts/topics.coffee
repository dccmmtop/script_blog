# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $('#blog-content').append( marked(content))
$(this).on("turbolinks:load", ->
  $('img').zoomify()
  $("pre code").prepend("<a class='btn btn-info copy pull-right' >copy</a>")
  $(".copy").click ->
    content = $(this).parent().parent().text().slice(4)
    copyInput = $("#copy")
    copyInput.val(content)
    copyInput.select()
    document.execCommand("Copy")
)
