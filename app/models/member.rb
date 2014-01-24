class Member < User
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :phone_number, presence: true
	validates :member_number, presence: true
	
  has_many :measurements

end
