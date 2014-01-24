class DevicePhoneNumber < ActiveRecord::Migration
  def change
    add_column :communication_devices, :phone_number, :string
  end
end
