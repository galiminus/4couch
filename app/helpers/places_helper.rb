module PlacesHelper
  def places_map(places_objects, options = {})
    places = places_to_map(places_objects)

    map_options = {
              type: "ROADMAP",
              auto_adjust: false,
              zoom: 2,
              minZoom: 2,
              center_latitude: 30.769569,
              center_longitude: 5.730057,
              raw: "{
                mapTypeControl: false,
                zoomControl: true,
                panControl: false,
                scaleControl: false
              }"
    }

    unless options[:lat].zero? || options[:lng].zero?
      map_options[:center_latitude] = options[:lat]
      map_options[:center_longitude] = options[:lng]
      map_options.delete :zoom
    end

    gmaps(markers: { data: places }, map_options: map_options)

  end

  def places_to_map(places_objects)
    places_objects.map.to_gmaps4rails do |place, marker|
      marker.json({id: place.id, link: user_place_path(place.user)})
      marker.title place.title
    end
  end

  def edit_place_map(place)
    places_map([place], lat: 0, lng: 0)
  end

  def active_in_world_map
    'active' if params[:controller] == 'places' && params[:action] == 'index'
  end
end
