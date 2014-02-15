class AddNoteToMeasurements < ActiveRecord::Migration
  def change
      add_column :measurements, :note, :text
  end
end
