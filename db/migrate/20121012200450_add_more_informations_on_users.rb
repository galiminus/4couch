class AddMoreInformationsOnUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :biography, :text
    add_column :users, :website, :string
  end
end
