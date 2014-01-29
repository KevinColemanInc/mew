puts 'starting seeding...'
User.destroy_all
case_manager_kevin = CaseManager.create!(first_name: "kevin", last_name: "coleman", email: "kevin.coleman@gatech.edu", password: "password", roles: [:case_manager_admin])
case_manager_ben = CaseManager.create!(first_name: "ben", last_name: "patz", email: "bjpatz@gmail.com", password: "password", roles: [:case_manager_admin])

member_kevin = Member.create!(phone_number: "4074544981", 
							  member_number: Time.now.to_i, 
							  first_name: "kevin", 
							  last_name: "coleman", 
							  email: "c.programer@gmail.com", 
							  password: "password")

member_kevin = Member.create!(phone_number: "4074544981", 
							  member_number: (Time.now - 3.day).to_i, 
							  first_name: "ben", 
							  last_name: "patz", 
							  email: "bjpatz+member@gmail.com",
							  password: "password")
puts 'made it here'
Meter.destroy_all
fora_meter = Meter.create!(mid: "foracare", bluetooth_mac: "FF:MAC:FF")

CommunicationDevice.destroy_all
fora_meter = CommunicationDevice.create!(cdid: "android-phone", phone_number: "4074531225", device_type: "Android Phone", device_model: "spider man")

puts 'ending seeding.'