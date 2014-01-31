class Member < User
  include Archivable

	validates :phone_number, presence: true
	validates :member_number, presence: true
	
  has_many :measurements

  has_and_belongs_to_many :meters
  has_and_belongs_to_many :communication_devices
  
  has_many :managed_members
  has_many :grouped_members

  def self.mine(case_manager)
    if case_manager.has_role? :case_manager_admin
      all
    else
      joins(:managed_members).where("managed_members.case_manager_id = ?", case_manager.id)
    end
  end

end
