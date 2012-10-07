$ ->
        myOptions =
            center: new google.maps.LatLng -34.397, 150.644
            zoom: 2
            mapTypeId: google.maps.MapTypeId.ROADMAP
        map = new google.maps.Map $('#map')[0], myOptions
        $.get "/couches.json",
              (couches) ->
                 console.log couches
