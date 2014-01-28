class GroupCreatorColumn < ActiveRecord::Migration
  def change
  	add_column :member_groups, :created_by_id, :uuid
  end
end
