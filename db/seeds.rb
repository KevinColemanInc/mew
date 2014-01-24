puts 'starting seeding...'
User.destroy_all
case_manager_kevin = CaseManager.create!(email: "kevin.coleman@gatech.edu", password: "password", roles: [:case_manager_admin])
case_manager_ben = CaseManager.create!(email: "bjpatz@gmail.com", password: "password", roles: [:case_manager_admin])

member_kevin = Member.create!(email: "c.programer@gmail.com", password: "password")

puts 'ending seeding.'