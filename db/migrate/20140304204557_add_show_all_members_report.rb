class AddShowAllMembersReport < ActiveRecord::Migration
  def change

    sql = 'SELECT 
            email as "email",                  
            sign_in_count as "sign in count",
            last_sign_in_at as "last sign in at",
            created_at as "created at",
            updated_at as "updated at",
            archived_at as "archived at",
            first_name as "first name",
            last_name as "last name",
            phone_number as "phone number",
            member_number as "member number",
            date_of_birth as "date of birth",
            note as "note"
           FROM Users'
    
    Report.create!(
      name: "All Members",
      sql: sql
      )

  end
end


