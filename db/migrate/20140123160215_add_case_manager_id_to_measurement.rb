class AddCaseManagerIdToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :case_manager_id, :uuid
  end
end
