class ChangeType < ActiveRecord::Migration
  def change
    add_column :glucose_levels, :reading_type, :string
    remove_column :glucose_levels, :type
  end
end
