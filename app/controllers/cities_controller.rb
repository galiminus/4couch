class CitiesController < ApplicationController
  def index
    @query = params[:q]
    @cities = City.search("#{@query}*")

    respond_to do |format|
      format.json do
        render json: (@cities.map do |city|
          {
            name: city.name,
            admin1: city.admin1,
            admin2: city.admin2,
            country: city.country,
            lat: city.lat,
            lng: city.lng
          }
        end)
      end
    end
  end
end
