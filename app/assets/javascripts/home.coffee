# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).ready ($) ->
  $('.owl-carousel').owlCarousel
    loop: true
    margin: 0
    responsive:
      0: items: 1
      600: items: 2
      1000: items: 3
  return
  $('#sidebar-collapse').click ->
	  $('#sidebar').addClass 'menu-compact'
	  $(this).addClass 'active'
	  return