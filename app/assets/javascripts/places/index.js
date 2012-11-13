//= require gmap3
//= require places/utils

$(function() {
    var map = $("#places-map");

    var options = {
	mapTypeId: google.maps.MapTypeId.ROADMAP,
	mapTypeControl: false,
	zoomControl: true,
	navigationControl: false,
	scrollwheel: true,
	streetViewControl: false
    }

    var lat = map.data('lat');
    var lng = map.data('lng');

    if (lat && lng) {
	options.center = [lat, lng];
    } else {
	options.center = [30.769569, 5.730057];
	options.zoom = 2;
	options.minZoom = 2;
    }

    map.gmap3({
	map:{
	    options: options
	}
    });

    getPlaces(function(places) {
	$.each(places, function(index, place) {
	    map.gmap3({
		marker: {
		    latLng: [place.latitude, place.longitude]
		}
	    });
	});
    });
});
