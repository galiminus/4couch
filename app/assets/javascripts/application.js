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
//= require_tree .

$(document).ready(function() {
    function setLinkOnMarkers() {
        for (var i = 0; i <  Gmaps.map.markers.length; ++i) {
	    marker = Gmaps.map.markers[i];
	    if (!marker.link) {
		return;
	    }
	    google.maps.event.
		addListener(marker.serviceObject,
			    'click',
			    function() {
				window.location = marker.link;
			    });
        }
    }

    if (Gmaps.map) {
	Gmaps.map.callback = function() {
	    setLinkOnMarkers();
	}
    }

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

		$.get("/users", {q: query},
		      function(result) {
			  users = $.map(result, function(user) {
			      return (user.username);
			  });
			  process(names.concat(users));
		      });
	    });
	},
	updater: function(name) {
	    $(location).attr('href', '/places?q=' + name + '&lat=' + locations[name].lat + "&lng=" + locations[name].lng);
	}
    })
});
