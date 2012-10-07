class AddLatitudeAndLongitudeToCouches < ActiveRecord::Migration
  def change
    add_column :couches, :latitude, :float
    add_column :couches, :longitude, :float
  end
end
