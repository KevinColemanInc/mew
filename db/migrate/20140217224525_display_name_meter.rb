class DisplayNameMeter < ActiveRecord::Migration
  def change
    add_column :meters, :display_name, :string
  end
end
