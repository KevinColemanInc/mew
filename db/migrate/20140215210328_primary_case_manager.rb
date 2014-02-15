class PrimaryCaseManager < ActiveRecord::Migration
  def change
    add_column :managed_members, :primary, :boolean, default: false
  end
end
