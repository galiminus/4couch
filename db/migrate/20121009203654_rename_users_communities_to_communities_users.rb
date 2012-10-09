class RenameUsersCommunitiesToCommunitiesUsers < ActiveRecord::Migration
  def up
    rename_table :users_communities, :communities_users
  end

  def down
    rename_table :communities_users, :users_communities
  end
end
