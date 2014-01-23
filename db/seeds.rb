puts 'starting seeding...'
CaseManager.destroy_all
case_manager_kevin = CaseManager.create!(email: "kevin.coleman@gatech.edu", password: "password")
case_manager_ben = CaseManager.create!(email: "bjpatz@gmail.com", password: "password")

Patient.destroy_all
case_manager_kevin = Patient.create!(email: "kevin.coleman@gatech.edu", password: "password2")
case_manager_ben = Patient.create!(email: "bjpatz@gmail.com", password: "password2")

puts 'ending seeding.'