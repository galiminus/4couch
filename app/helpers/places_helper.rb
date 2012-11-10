module PlacesHelper
  def places_map(places, options)

    map_options = {
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

    unless options[:lat].zero? || options[:lng].zero?
      map_options[:center_latitude] = options[:lat]
      map_options[:center_longitude] = options[:lng]
      map_options.delete :zoom
    end

    gmaps(markers: { data: places }, map_options: map_options)

  end

  def markdown(text)
    renderer = Redcarpet::Render::XHTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render text
  end
end
