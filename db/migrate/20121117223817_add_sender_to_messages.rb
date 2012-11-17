class AddSenderToMessages < ActiveRecord::Migration
  def up
    add_column  :messages, :user_id, :integer
    add_index   :messages, :user_id
  end

  def down
    remove_column :messages, :user_id
  end
end
