# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#idea_description").bind "keydown keyup keypress change", ->
    length = $(this).val().length
    $("#idea_description + .help-block").html length + " / 4000 chars"

  $("#idea_name").bind "keydown keyup keypress change", ->
    length = $(this).val().length
    $("#idea_name + .help-block").html length + " / 245 chars"
