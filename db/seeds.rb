puts 'starting seeding...'
User.destroy_all
case_manager_kevin = User.create!(email: "kevin.coleman@gatech.edu", password: "password")
case_manager_ben = User.create!(email: "bjpatz@gmail.com", password: "password")

puts 'ending seeding.'