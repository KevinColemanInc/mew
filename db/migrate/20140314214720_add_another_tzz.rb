class AddAnotherTzz < ActiveRecord::Migration
  def change
    add_column :measurements, :measured_at_time_zone, :string
  end
end
