class PlacesController < ApplicationController
  def index
    @query = params[:q]
    @places = Place.search("#{@query}*")

    respond_to do |format|
      format.json do
        render json: @places.map do |city|
          {
            name: city.name,
            lat: city.lat,
            lng: city.lng
          }
        end
      end
    end
  end
end
