class Place < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  acts_as_gmappable process_geocoding: false, validation: false

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :slug,         :index    => :not_analyzed
    indexes :title,        :analyzer => 'snowball', :boost => 100
    indexes :description,  :analyzer => 'snowball'
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :description, :title

  belongs_to :user
end
