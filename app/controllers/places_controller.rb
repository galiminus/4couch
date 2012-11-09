class PlacesController < ApplicationController
  def index
    @query = params[:q]
    @places = Place.search("#{@query}*")

    respond_to do |format|
      format.json do
        render json: (@places.map do |place|
          {
            name: place.name,
            admin1: place.admin1,
            admin2: place.admin2,
            country: place.country,
            lat: place.lat,
            lng: place.lng
          }
        end)
      end
    end
  end
end
