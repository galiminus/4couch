class ChangeUsersAndPlacesToHaveOnlyOnePlacePerUser < ActiveRecord::Migration
  def up
    add_column :users, :place_id, :integer
    add_index  :users, :place_id
  end

  def down
    remove_column :users, :place_id
  end
end
