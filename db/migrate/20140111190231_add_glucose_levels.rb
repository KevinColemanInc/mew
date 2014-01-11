class AddGlucoseLevels < ActiveRecord::Migration
  def change
    add_column :glucose_levels, :type, :string
    add_column :glucose_levels, :code_number, :string
    
    remove_column :glucose_levels, :systolic
    remove_column :glucose_levels, :MAP
    remove_column :glucose_levels, :diastolic
    remove_column :glucose_levels, :pulse

  end
end
