class RemoveTitleFromPlaces < ActiveRecord::Migration
  def up
    remove_column :places, :title
  end

  def down
    add_column :places, :title, :string
  end
end
