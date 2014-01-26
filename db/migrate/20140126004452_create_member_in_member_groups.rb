class CreateMemberInMemberGroups < ActiveRecord::Migration
  def change
    create_table :member_in_member_groups, id: :uuid do |t|
      t.uuid :member_id
      t.uuid :member_group_id

      t.timestamps
    end
  end
end
