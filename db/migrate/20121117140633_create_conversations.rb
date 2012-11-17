class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :user, :null => false
      t.references :recipient, :null => false

      t.timestamps
    end
  end
end
