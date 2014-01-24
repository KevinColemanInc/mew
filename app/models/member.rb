class Member < User
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :phone_number, presence: true
	validates :member_number, presence: true
	validates :date_of_birth, presence: true
	
end
