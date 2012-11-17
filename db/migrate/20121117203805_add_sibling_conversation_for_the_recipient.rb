class AddSiblingConversationForTheRecipient < ActiveRecord::Migration
  def up
    add_column  :conversations, :sibling_id, :integer
    add_index   :conversations, :sibling_id
  end

  def down
    remove_column :conversations, :sibling_id
  end
end
