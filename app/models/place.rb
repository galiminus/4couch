class Place < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :slug,         :index    => :not_analyzed
    indexes :title,        :analyzer => 'snowball', :boost => 100
    indexes :description,  :analyzer => 'snowball'
  end

  attr_accessible :description, :title, :lat, :lng, :user, :city

  belongs_to :user

  before_update :get_city_informations

  def get_city_informations
    city = City.search("#{self.city}*").first

    self.city = "#{city.name} - #{city.admin1}, #{city.country}"
    self.lat = city.lat
    self.lng = city.lng
  end
end
