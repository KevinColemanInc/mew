class RenameUsersToMember < ActiveRecord::Migration
  def change
    rename_column :meters_users, :user_id, :member_id

    rename_column :member_groups_users, :user_id, :member_id

    rename_column :communication_devices_users, :user_id, :member_id
  end
end
