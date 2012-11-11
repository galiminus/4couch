class PlacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lat = params[:lat].to_f
    @lng = params[:lng].to_f
    @places = Place.all.to_gmaps4rails do |place, marker|
      marker.json({id: place.id, link: user_place_path(place.user)})
      marker.title place.title
    end

    respond_to do |format|
      format.html
      format.json { render json: @places }
    end
  end
end

