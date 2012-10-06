class Couch < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :description, :title
end
