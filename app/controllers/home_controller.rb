class HomeController < ApplicationController
  def index
    redirect_to places_path if user_signed_in?

    @places = Place.all
  end
end
