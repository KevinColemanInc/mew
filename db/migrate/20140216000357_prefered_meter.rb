class PreferedMeter < ActiveRecord::Migration
  def change
    add_column :meters, :preferred_meter_id, :uuid
  end
end
