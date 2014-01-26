class UsersHaveUuid < ActiveRecord::Migration
  def change
  	change_column :users, :id, :uuid
  end
end
