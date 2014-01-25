class LastCommunicatedTimeDevice < ActiveRecord::Migration
  def change
    add_column :communication_devices, :last_communicated_at, :datetime
  end
end
