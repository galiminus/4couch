module HomeHelper
  def global_map
    gmaps({"map_options" => { "type" => "SATELLITE", "center_longitude" => 180, "zoom" => 3, "auto_adjust" => true},
            "markers"     => { "data" => '[{ "description": "", "title": "", "lng": "5.9311119", "lat": "43.1251606", "picture": "", "width": "", "height": "" } ,{ "description": "", "title": "", "lng": "2.3509871", "lat": "48.8566667", "picture": "", "width": "", "height": "" } ]',
            },
            "polylines"   => { "data" => ' [ [
                        {"lng": -122.214897, "lat": 37.772323},
                        {"lng": -157.821856, "lat": 21.291982},
                        {"lng": 178.431, "lat": -18.142599},
                        {"lng": 153.027892, "lat": -27.46758}
                        ],
                        [
                        {"lng": -120.214897, "lat": 30.772323, "strokeColor": "#000", "strokeWeight" : 2 },
                        {"lng": -10.821856, "lat": 50.291982}
                        ] ]' },
    "polygons"    => { "data" => '[ [
                        {"lng": -80.190262, "lat": 25.774252}, 
                        {"lng": -66.118292, "lat": 18.466465},
                        {"lng": -64.75737, "lat": 32.321384}
                        ] ]' },
    "circles"     => { "data" => '[
                        {"lng": -122.214897, "lat": 37.772323, "radius": 1000000},
                        {"lng": 122.214897, "lat": 37.772323, "radius": 1000000, "strokeColor": "#FF0000"}
                        ]',
                                       },
            "direction"   => { "data"    => { "from" => "toulon, france", "to" => "paris, france"} ,
              "options" => {"waypoints" => ["toulouse, france", "brest, france"], "travelMode" => "DRIVING", "display_panel" => true, "panel_id" => "instructions"}
            }})
  end
end
