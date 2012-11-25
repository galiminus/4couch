class RenameLatitudeAndLongitudeToLatAndLngInPlaces < ActiveRecord::Migration
  def change
    rename_column :places, :latitude, :lat
    rename_column :places, :longitude, :lng
  end
end
