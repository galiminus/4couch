class HomeController < ApplicationController
  def index
    @couches = Couch.all.to_gmaps4rails do |couch, marker|
      marker.json({id: couch.id})
      marker.title couch.title
    end
  end

  def search
    @query = params[:q]
    @communities = Community.search "#{@query}*"
    @couches = Couch.search "#{@query}*"
  end
end
