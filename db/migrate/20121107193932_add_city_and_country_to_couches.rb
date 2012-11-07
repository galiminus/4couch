class AddCityAndCountryToCouches < ActiveRecord::Migration
  def change
    add_column :couches, :city, :string
    add_column :couches, :country, :string
  end
end
