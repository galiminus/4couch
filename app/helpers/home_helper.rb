module HomeHelper
  def map(couches)
    gmaps({
            markers: { data: couches },
            map_options: {
              type: "ROADMAP",
              center_longitude: 200,
              auto_zoom: true,
              auto_adjust: true,
              raw: "{
                mapTypeControl: false,
                zoomControl: false,
                panControl: false,
                scaleControl: false
              }"
            }
          })
  end
end
