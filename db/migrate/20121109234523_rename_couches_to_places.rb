class RenameCouchesToPlaces < ActiveRecord::Migration
  def up
    rename_table :couches, :places
  end

  def down
    rename_table :places, :couches
  end
end
