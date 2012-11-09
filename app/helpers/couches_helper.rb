module CouchesHelper
  def couches_map(couches)
    gmaps({
            markers: { data: couches },
            map_options: {
              libraries: ['places'],
              type: "ROADMAP",
              auto_adjust: false,
              zoom: 2,
              center_latitude: 30.769569,
              center_longitude: 5.730057,
              raw: "{
                mapTypeControl: false,
                zoomControl: true,
                panControl: false,
                scaleControl: false
              }"
            }
          })
  end
end
