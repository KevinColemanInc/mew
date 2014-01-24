puts 'starting seeding...'
User.destroy_all
case_manager_kevin = CaseManager.create!(first_name: "kevin", last_name: "coleman", email: "kevin.coleman@gatech.edu", password: "password", roles: [:case_manager_admin])
case_manager_ben = CaseManager.create!(first_name: "ben", last_name: "patz", email: "bjpatz@gmail.com", password: "password", roles: [:case_manager_admin])

member_kevin = Member.create!(phone_number: "4074544981", member_number: Time.now.to_i, first_name: "kevin", last_name: "coleman", email: "c.programer@gmail.com", password: "password")

puts 'ending seeding.'