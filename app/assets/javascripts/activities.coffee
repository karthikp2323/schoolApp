# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

chart_run = ->
  data = [ {
    color: 'red'
    label: 'Visits'
    data: [
      [
        3
        10
      ]
      [
        4
        13
      ]
      [
        5
        12
      ]
      [
        6
        16
      ]
      [
        7
        19
      ]
      [
        8
        19
      ]
      [
        9
        24
      ]
      [
        10
        19
      ]
      [
        11
        18
      ]
      [
        12
        21
      ]
      [
        13
        17
      ]
      [
        14
        14
      ]
      [
        15
        12
      ]
      [
        16
        14
      ]
      [
        17
        15
      ]
    ]
  } ]
  options = 
    series:
      lines:
        show: true
        fill: true
        fillColor: colors: [
          { opacity: 0.2 }
          { opacity: 0 }
        ]
      points: show: true
    legend: show: false
    xaxis:
      tickDecimals: 0
      tickLength: 0
      color: '#ccc'
    yaxis:
      min: 0
      tickLength: 0
      color: '#ccc'
    grid:
      hoverable: true
      clickable: false
      borderWidth: 0
      aboveData: false
      color: '#fbfbfb'
    tooltip: true
  placeholder = $('#visit-chart')
  plot = $.plot(placeholder, data, options)
  return

$(document).ready ($) ->

  $(window).bind 'load', ->
    chart_run()
    return

  $('.sidebar-menu li').first().click ->
    chart_run()
    return

  $('#contacttab').click ->

    initialize = ->
      myLatlng = new (google.maps.LatLng)(43.6531935, -79.3806243)
      mapOptions = 
        zoom: 15
        scrollwheel: false
        center: myLatlng
        mapTypeId: google.maps.MapTypeId.ROADMAP
      map = new (google.maps.Map)(document.getElementById('contact-map'), mapOptions)
      marker = new (google.maps.Marker)(
        position: myLatlng
        map: map
        title: 'Map')
      return

    google.maps.event.addDomListener window, 'click', initialize
    return
  return
