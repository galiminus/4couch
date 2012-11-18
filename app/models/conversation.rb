class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User'

  has_many :messages

  attr_accessible :recipient, :user, :read

  def read!
    update_attributes(read: true)
  end

  def unread!
    update_attributes(read: false)
  end

  def to_param
    recipient.slug
  end
end
