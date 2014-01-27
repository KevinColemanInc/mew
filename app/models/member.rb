class Member < User
	validates :phone_number, presence: true
	validates :member_number, presence: true
	
  has_many :measurements

  has_and_belongs_to_many :meters
  has_and_belongs_to_many :communication_devices
  has_and_belongs_to_many :member_groups, through: :grouped_members
  has_and_belongs_to_many :case_managers, through: :managed_members

  has_many :managed_members
  has_many :grouped_members

end
