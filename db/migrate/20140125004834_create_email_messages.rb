class CreateEmailMessages < ActiveRecord::Migration
  def change
    create_table :email_messages, id: :uuid do |t|
      t.string :to
      t.string :from
      t.text :body
      t.uuid :member_id
      t.uuid :case_manager_id

      t.timestamps
    end
  end
end
