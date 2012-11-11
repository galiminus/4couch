class RemovePlaceIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :place_id
  end
end
