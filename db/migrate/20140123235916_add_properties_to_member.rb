class AddPropertiesToMember < ActiveRecord::Migration
  def change
    rename_table :members, :users
    drop_table :case_managers
    add_column :users, :type, :string
  end
end
