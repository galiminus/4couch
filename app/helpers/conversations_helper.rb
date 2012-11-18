module ConversationsHelper
  def active_on_recipient(conversation, recipient)
    'active' if conversation.recipient == recipient
  end

  def media_class_for(message, user)
    if message.user == user
      "media span7 pagination-right pull-right"
    else
      "media span7"
    end
  end

  def media_object_link_class_for(message, user)
    if message.user == user
      "pull-right"
    else
      "pull-left"
    end
  end
end
