module ConversationsHelper
  def active_on_recipient(conversation, recipient)
    'active' if conversation.recipient == recipient
  end
end
