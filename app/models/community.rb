class Community < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :slug,         :index    => :not_analyzed
    indexes :name,         :analyzer => 'snowball', :boost => 100
    indexes :description,  :analyzer => 'snowball'
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :description, :name

  has_and_belongs_to_many :users
end
