class HomeController < ApplicationController
  def index
    redirect_to couches_path if user_signed_in?

    @couches = Couch.all.to_gmaps4rails
  end

  def search
    @query = params[:q]
    @communities = Community.search "#{@query}*"
    @couches = Couch.search "#{@query}*"
  end
end
