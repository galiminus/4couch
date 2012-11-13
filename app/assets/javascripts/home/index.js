//= require slabtext
//= require gmap3
//= require places/utils

$(function() {
    $("h2.slab").slabText({'fontRatio': 2.8});

    var map = $("#home-map");
    map.gmap3({
	map:{
	    options:{
		center: [30.769569, 5.730057],
		zoom: 1,
		minZoom: 1,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		mapTypeControl: false,
		zoomControl: true,
		navigationControl: false,
		scrollwheel: true,
		streetViewControl: false
	    }
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
