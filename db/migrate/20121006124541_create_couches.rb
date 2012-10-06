class CreateCouches < ActiveRecord::Migration
  def change
    create_table :couches do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
