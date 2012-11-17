class RemoveSiblingToConversation < ActiveRecord::Migration
  def up
    remove_column :conversations, :sibling_id
  end

  def down
    add_column  :conversations, :sibling_id, :integer
    add_index   :conversations, :sibling_id
  end
end
