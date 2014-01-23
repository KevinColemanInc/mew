class CreateCommunicationDevices < ActiveRecord::Migration
  def change
    create_table :communication_devices, id: :uuid do |t|
      t.string :cdid
      t.timestamps
    end
    create_table :communication_devices_patients, id: false do |t|
      t.uuid :communication_device_id
      t.uuid :patient_id
    end
  end
end
