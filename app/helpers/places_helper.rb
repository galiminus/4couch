module PlacesHelper
  def active_in_world_map
    'active' if params[:controller] == 'places' && params[:action] == 'index'
  end
end
