class ArchivePatients < ActiveRecord::Migration
  def change
    add_column :patients, :archived_at, :datetime
  end
end
