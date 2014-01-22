class MeasurementLinking < ActiveRecord::Migration
  def change
  	rename_table :glucose_levels, :measurements
  	remove_column :measurements, :serial_number

  	add_column :measurements, :communication_device_id, :uuid
  	add_column :measurements, :meter_id, :uuid
  	add_column :measurements, :patient_id, :uuid

  end
end
