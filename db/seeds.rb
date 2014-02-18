puts 'starting seeding...'
User.destroy_all
Meter.destroy_all
CommunicationDevice.destroy_all
ManagedMember.destroy_all

case_manager_kevin = CaseManager.create!(first_name: "kevin", last_name: "coleman", email: "kevin.coleman@gatech.edu", password: "password", roles: [:case_manager_admin])
case_manager_ben = CaseManager.create!(first_name: "ben", last_name: "patz", email: "bjpatz@gmail.com", password: "password", roles: [:case_manager_admin])

20.times do |i|
	case_manager_ben = CaseManager.create!(phone_number: Faker::PhoneNumber.phone_number, 
																				 first_name: Faker::Name.first_name, 
																				 last_name: Faker::Name.last_name, 
																				 email: "#{i}" + Faker::Internet.email, 
																				 password: Faker::Lorem.characters(15), 
																				 roles: [:case_manager_admin])
end

member_kevin = Member.create!(phone_number: "4074544981", 
							  member_number: Time.now.to_i, 
							  first_name: "kevin", 
							  last_name: "coleman", 
							  email: "c.programer@gmail.com", 
							  password: "password")

member_ben = Member.create!(phone_number: "4074544981", 
							  member_number: (Time.now - 3.day).to_i, 
							  first_name: "ben", 
							  last_name: "patz", 
							  email: "bjpatz+member@gmail.com",
							  password: "password")

ManagedMember.create(member:member_kevin, case_manager: case_manager_kevin)
ManagedMember.create(member:member_ben, case_manager: case_manager_ben)

ManagedMember.create(member:member_kevin, case_manager: case_manager_ben)
ManagedMember.create(member:member_ben, case_manager: case_manager_kevin)

20.times do |i|
	u = Member.create!(phone_number: Faker::PhoneNumber.phone_number, 
							  member_number: "#{rand(100000..1000000000000)}", 
							  first_name: Faker::Name.first_name, 
							  last_name: Faker::Name.last_name, 
							  email: "#{i}" + Faker::Internet.email,
							  password: Faker::Lorem.characters(15))

	ManagedMember.create(member:u, case_manager: case_manager_kevin)
	ManagedMember.create(member:u, case_manager: case_manager_ben)

	c = CommunicationDevice.create!(cdid: "CD#{i}",
																 device_type: "android-phone",
																 device_model: "Galaxy",
																 phone_number: Faker::PhoneNumber.phone_number
																 )

	meter = Meter.create!(mid: "M#{5}", 
												bluetooth_mac: (1..6).map{"%0.2X"%rand(256)}.join(":"),
												display_name: Faker::Lorem.words(3, false).join(" "),
												model: "blood_glucose")

	last_measurement = rand(90..110)
	measurement_count = rand(10..52)

	measurement_count.times do |i|
		delta = rand(-7..10)

		last_measurement = last_measurement + delta  > 70 ? last_measurement + delta : last_measurement - delta

		Measurement.create!(glucose_value: "#{last_measurement}",
												 measured_at: Time.now - (measurement_count.days + i.days),
												 code_number: 2,
												 reading_type: 2,
												 communication_device: c,
												 meter: meter,
												 member: u)
	end

end

fora_meter = Meter.create!(mid: "foracare", bluetooth_mac: (1..6).map{"%0.2X"%rand(256)}.join(":"),display_name: Faker::Lorem.words(3, false).join(" "),
												model: "glucose_value")
c_device = CommunicationDevice.create!(cdid: "android-phone", phone_number: "4074531225", device_type: "Android Phone", device_model: "spider man")

puts 'ending seeding.'




