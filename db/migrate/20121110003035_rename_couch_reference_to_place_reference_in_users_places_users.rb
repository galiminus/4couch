class RenameCouchReferenceToPlaceReferenceInUsersPlacesUsers < ActiveRecord::Migration
  def up
    rename_column :places_users, :couch_id, :place_id
  end

  def down
    rename_column :places_users, :place_id, :couch_id
  end
end
