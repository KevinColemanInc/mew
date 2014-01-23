class CreateGlucoseLevels < ActiveRecord::Migration
  def change
    create_table :glucose_levels, id: :uuid do |t|
      t.string :serial_number
      t.integer :glucose_value
      t.integer :systolic
      t.integer :MAP
      t.integer :diastolic
      t.integer :pulse
      t.datetime :measured_at
      t.datetime :retrieved_at
      t.timestamps
    end
  end
end
