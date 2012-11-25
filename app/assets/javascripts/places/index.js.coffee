#= require gmap3

$ ->
  map = $("#places-map")

  options = {
   	mapTypeId: google.maps.MapTypeId.ROADMAP,
   	mapTypeControl: false,
   	zoomControl: true,
   	navigationControl: false,
   	scrollwheel: true,
   	streetViewControl: false
  }

  if map.data('lat') and map.data('lng')
   	options.center = [map.data('lat'), map.data('lng')]
  else
   	options.center = [30.769569, 5.730057]
   	options.zoom = 2
   	options.minZoom = 2

  map.gmap3(map: { options: options	});

  $.get "/places.json", (places) ->
    $.each places, (index, place) ->
      map.gmap3(marker: { latLng: [place.lat, place.lng] })
