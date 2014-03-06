class MembersWithoutMeasurements < ActiveRecord::Migration
  def change

     sql = 'SELECT 
            Users.email as "email",                  
            Users.sign_in_count as "sign in count",
            Users.last_sign_in_at as "last sign in at",
            Users.created_at as "created at",
            Users.updated_at as "updated at",
            Users.archived_at as "archived at",
            Users.first_name as "first name",
            Users.last_name as "last name",
            Users.phone_number as "phone number",
            Users.member_number as "member number",
            Users.date_of_birth as "date of birth",
            Users.note as "note"
           FROM Users
           left join measurements on users.id = measurements.member_id
           where measurements.id is null'
    records_array = ActiveRecord::Base.connection.execute(sql)
    
    Report.create!(
      name: "Members without measuremnts",
      sql: sql
      )

  end
end
