class MeasurementHash < ActiveRecord::Migration
  def change
    add_column :measurements, :token, :string
  end
end
