class FixPreferredMeterId < ActiveRecord::Migration
  def change
    remove_column :meters, :preferred_meter_id
    add_column :users, :preferred_meter_id, :uuid
  end
end
