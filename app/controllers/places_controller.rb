class PlacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lat = params[:lat].to_f
    @lng = params[:lng].to_f
    @places = Place.all

    respond_to do |format|
      format.html
      format.json { render json: @places }
    end
  end
end

