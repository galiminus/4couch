class Couch < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.city}, #{self.country}"
  end

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :slug,         :index    => :not_analyzed
    indexes :title,        :analyzer => 'snowball', :boost => 100
    indexes :description,  :analyzer => 'snowball'
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :description, :title

  has_and_belongs_to_many :users
end
