class RenamePatientToMember < ActiveRecord::Migration
  def change
    rename_table :patients, :members
  end
end
