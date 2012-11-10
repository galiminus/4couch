class RenameCouchesUsersToPlacesUsers < ActiveRecord::Migration
  def up
    rename_table :couches_users, :places_users
  end

  def down
    rename_table :places_users, :couches_users
  end
end
