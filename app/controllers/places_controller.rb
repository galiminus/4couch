class PlacesController < ApplicationController
  def index
    @lat = params[:lat]
    @lng = params[:lng]

    @places = Place.all

    respond_to do |format|
      format.html
      format.json { render json: @places }
    end
  end
end

