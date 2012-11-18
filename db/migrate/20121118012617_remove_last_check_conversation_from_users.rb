class RemoveLastCheckConversationFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :last_conversation_check_at
  end

  def down
    add_column :users, :last_conversation_check_at, :datetime
  end
end
