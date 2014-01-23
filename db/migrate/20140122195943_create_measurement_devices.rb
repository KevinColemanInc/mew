class CreateMeasurementDevices < ActiveRecord::Migration
  def change
    create_table :meters, id: :uuid do |t|
      t.string :mid
      t.string :bluetooth_mac
      t.timestamps
    end
    create_table :meters_patients, id: false do |t|
      t.uuid :meter_id
      t.uuid :patient_id
    end
    create_table :communication_devices_meters, id: false do |t|
      t.uuid :meter_id
      t.uuid :communication_device_id
    end
  end
end
