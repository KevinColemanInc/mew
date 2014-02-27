class AddPayloadToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :payload, :string
  end
end
