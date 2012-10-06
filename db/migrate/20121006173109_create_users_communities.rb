class CreateUsersCommunities < ActiveRecord::Migration
  def change
    create_table :users_communities do |t|
      t.references :user, :null => false
      t.references :community, :null => false
    end
  end
end
