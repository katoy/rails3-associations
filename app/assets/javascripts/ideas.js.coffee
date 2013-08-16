# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $("#idea_name").val() != undefined 
    counter_bind('#idea_name', 32)
    counter_bind('#idea_description', 4000)
