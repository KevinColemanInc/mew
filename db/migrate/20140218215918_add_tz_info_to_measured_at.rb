class AddTzInfoToMeasuredAt < ActiveRecord::Migration
  def change
    add_column :measurements, :retrieved_at_time_zone, :string
  end
end
