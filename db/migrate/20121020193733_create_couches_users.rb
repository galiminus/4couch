class CreateCouchesUsers < ActiveRecord::Migration
  def change
    create_table :couches_users do |t|
      t.references :user, :null => false
      t.references :couch, :null => false
    end
  end
end
