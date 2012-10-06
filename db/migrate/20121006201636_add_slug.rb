class AddSlug < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    add_column :communities, :slug, :string
    add_index :communities, :slug, unique: true

    add_column :couches, :slug, :string
    add_index :couches, :slug, unique: true
  end
end
