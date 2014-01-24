class AddComDeviceTypeAndModel < ActiveRecord::Migration
  def change
  	add_column :communication_devices, :device_type, :string
  	add_column :communication_devices, :device_model, :string
  end
end
