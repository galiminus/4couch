class AddCheckConversationDateToUsers < ActiveRecord::Migration
  def up
    add_column :users, :last_conversation_check_at, :datetime
  end

  def down
    remove_column :users, :last_conversation_check_at
  end
end
