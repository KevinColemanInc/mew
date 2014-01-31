class ArchiveMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :archived_at, :datetime
  end
end
