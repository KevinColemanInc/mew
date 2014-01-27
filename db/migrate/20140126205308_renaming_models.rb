class RenamingModels < ActiveRecord::Migration
  def change
    drop_table :case_managers_member_groups
    rename_table :case_managers_members, :managed_members
    drop_table :member_groups_users
    rename_table :member_in_member_groups, :grouped_members
  end
end
