class HomeController < ApplicationController
  def index
    redirect_to user_path(current_user) if user_signed_in?
  end

  def search
    @query = params[:q]
    @communities = Community.search "#{@query}*"
    @couches = Couch.search "#{@query}*"
  end
end
