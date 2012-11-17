class Message < ActiveRecord::Base
  attr_accessible :body, :conversation

  belongs_to :conversation
  belongs_to :user

  attr_accessible :user

  def self.create_with_conversations(attributes, user, recipient)
    transaction do
      create_with_conversation(attributes, user, user, recipient)
      create_with_conversation(attributes, user, recipient, user)
    end
  end

  protected

  def self.create_with_conversation(attributes, sender, user, recipient)
    conversation =
      Conversation.where(user_id: user, recipient_id: recipient).first_or_create!
    message = Message.create!(attributes.merge(conversation: conversation, user: sender))
    conversation.messages << message
    conversation.save!
  end
end
