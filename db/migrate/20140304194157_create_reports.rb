class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :display_name
      t.string :url_name
      t.column :columns, :json
      t.text :sql
      t.timestamps
    end
  end
end
