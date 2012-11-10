module HomeHelper
  def home_map(places)
    gmaps({
            markers: { data: places },
            map_options: {
              type: "ROADMAP",
              auto_adjust: false,
              zoom: 2,
              minZoom: 2,
              center_latitude: 30.769569,
              center_longitude: 5.730057,
              raw: "{
                mapTypeControl: false,
                zoomControl: false,
                panControl: false,
                scaleControl: false,
                streetViewControl: false
              }"
            }
          })
  end
end
