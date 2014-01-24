class StiConsiderationsForMembersUsers < ActiveRecord::Migration
  def change
    rename_table :meters_members, :meters_users
    rename_column :meters_users, :member_id, :user_id

    rename_table :members_member_groups, :member_groups_users
    rename_column :member_groups_users, :member_id, :user_id

    rename_table :communication_devices_members, :communication_devices_users
    rename_column :communication_devices_users, :member_id, :user_id
  end
end
