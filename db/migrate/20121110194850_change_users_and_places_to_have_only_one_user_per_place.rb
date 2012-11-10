class ChangeUsersAndPlacesToHaveOnlyOneUserPerPlace < ActiveRecord::Migration
  def up
    drop_table :places_users
    add_column :places, :user_id, :integer
    add_index  :places, :user_id
  end

  def down
    remove_column :places, :user_id
  end
end
