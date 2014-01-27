class CreateCaseManagersMembers < ActiveRecord::Migration
  def change
    create_table :case_managers_members, id: :uuid do |t|
      t.uuid :case_manager_id
      t.uuid :member_id
      t.timestamps
    end
  end
end
