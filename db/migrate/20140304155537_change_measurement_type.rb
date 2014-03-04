class ChangeMeasurementType < ActiveRecord::Migration
  def change
    change_column :measurements, :reading_type, :string
  end
end
