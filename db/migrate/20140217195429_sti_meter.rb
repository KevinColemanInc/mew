class StiMeter < ActiveRecord::Migration
  def change
    add_column :meters, :model, :string
  end
end
