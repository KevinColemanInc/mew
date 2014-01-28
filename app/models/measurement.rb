class Measurement < ActiveRecord::Base
	validates :glucose_value, presence: true
	validates :measured_at, presence: true
	validates :code_number, presence: true
	validates :reading_type, presence: true
	validates :meter_id, presence: true, unless: :case_manager_id
	validates :case_manager_id, presence: true, unless: :meter_id
  validates :member_id, presence: true

	belongs_to :communication_device
	belongs_to :meter
  belongs_to :member
  belongs_to :case_manager

  def self.mine(user)
  	where(member: user)
  end	
end

