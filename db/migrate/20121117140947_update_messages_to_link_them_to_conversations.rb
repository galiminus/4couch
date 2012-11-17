class UpdateMessagesToLinkThemToConversations < ActiveRecord::Migration
  def up
    remove_column :messages, :recipient_id
    remove_column :messages, :sender_id

    add_column    :messages, :conversation_id, :integer
    add_index     :messages, :conversation_id
  end

  def down
    remove_column :messages, :conversation_id

    add_column :messages, :recipient_id
    add_column :messages, :sender_id
  end
end
