// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap

$(document).ready(function() {
/*
    function setMarkerLink(marker) {
	google.maps.event.
	    addListener(marker.serviceObject,
			'click',
			function() {
			    window.location = marker.link;
			});

    }

    function setMarkersLinks() {
        for (var i = 0; i <  Gmaps.map.markers.length; ++i) {
	    marker = Gmaps.map.markers[i];
	    if (!marker.link) {
		return;
	    }
	    setMarkerLink(marker);
        }
    }

    if (Gmaps.map) {
	Gmaps.map.callback = function() {
	    setMarkersLinks();
	}
    }
*/
    var locations = {};
    $(".search-query").typeahead({
	minLength: 3,
	items: 20,
	source: function(query, process) {
	    $.get("/cities", {q: query}, function(result) {
		names = $.map(result, function(locality) {
		    var name = locality.name + " - " + locality.admin1 + ", " + locality.country;
		    locations[name] = {lat: locality.lat, lng: locality.lng};
		    return (name);
		});
		process(names);
	    });
	},
	updater: function(name) {
	    $(location).attr('href', '/places?q=' + name + '&lat=' + locations[name].lat + "&lng=" + locations[name].lng);
	}
    })

    $('.dropdown-toggle').dropdown();
});
