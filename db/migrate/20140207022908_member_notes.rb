class MemberNotes < ActiveRecord::Migration
  def change
    add_column :users, :note, :text
  end
end
