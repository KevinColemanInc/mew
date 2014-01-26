class Member < User
	validates :phone_number, presence: true
	validates :member_number, presence: true
	
  has_many :measurements

  has_and_belongs_to_many :meters
  has_and_belongs_to_many :communication_devices
  has_and_belongs_to_many :member_groups

  has_many :member_in_member_groups

end
