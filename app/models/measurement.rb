class Measurement < ActiveRecord::Base
	validates :glucose_value, presence: true
	validates :measured_at, presence: true
	validates :code_number, presence: true
	validates :reading_type, presence: true
	validates :communication_device_id, presence: true
	validates :meter_id, presence: true, unless: :case_manager_id
	validates :case_manager_id, presence: true, unless: :meter_id
	validates :patient_id, presence:true

	belongs_to :communication_device
	belongs_to :meter
	belongs_to :patient
end
