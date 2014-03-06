class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports, id: :uuid do |t|
      t.string :name
      t.text :sql
      t.timestamps
    end
  end
end
