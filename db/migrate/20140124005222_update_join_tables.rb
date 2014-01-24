class UpdateJoinTables < ActiveRecord::Migration
  def change
  	rename_table :case_managers_patient_groups, :case_managers_member_groups
  	rename_column :case_managers_member_groups, :patient_group_id, :member_group_id

  	rename_table :communication_devices_patients, :communication_devices_members
  	rename_column :communication_devices_members, :patient_id, :member_id

  	rename_column :measurements, :patient_id, :member_id

  	rename_table :meters_patients, :meters_members
  	rename_column :meters_members, :patient_id, :member_id

  	rename_table :patients_patient_groups, :members_member_groups
  	rename_column :members_member_groups, :patient_id, :member_id
  	rename_column :members_member_groups, :patient_group_id, :member_group_id

  end
end
