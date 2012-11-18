class AddAReadFlagToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :read, :boolean, :default => false
  end
end
