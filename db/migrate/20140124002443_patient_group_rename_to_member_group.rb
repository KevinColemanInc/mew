class PatientGroupRenameToMemberGroup < ActiveRecord::Migration
  def change
  	rename_table :patient_groups, :member_groups
  end
end
