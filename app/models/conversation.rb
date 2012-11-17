class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User'

  has_many :messages

  attr_accessible :recipient, :user

  def to_param
    recipient.slug
  end
end
