class AddPropertiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :member_number, :string
    add_column :users, :date_of_birth, :datetime
  end
end
