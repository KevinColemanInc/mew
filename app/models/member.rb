class Member < User
  include Archivable

	validates :phone_number, presence: true
	validates :member_number, presence: true
	
  has_many :measurements

  has_and_belongs_to_many :meters
  has_many :case_managers, through: :managed_members

  belongs_to :preferred_meter, class_name: "Meter"
  
  has_many :managed_members
  has_many :grouped_members

  def self.mine(case_manager)
    if case_manager.has_role? :case_manager_admin
      all
    else
      joins(:managed_members).where("managed_members.case_manager_id = ?", case_manager.id)
    end
  end

  def measurement_count_last_days(days)
    self.measurements.map{|m| m if (m.measured_at > (Time.now - days.days)) and m.archived_at.nil? }.compact.length
  end

  def primary_case_manager
    managed_member = (managed_members.select {|n| n.primary }).first
    managed_member ||= managed_members.first
    managed_member.case_manager if managed_member
  end

end
