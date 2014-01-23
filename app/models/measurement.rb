class Measurement < ActiveRecord::Base
	validates :glucose_value, presence: true
	validates :measured_at, presence: true
	validates :code_number, presence: true
	validates :reading_type, presence: true
	validates :communication_device_id, presence: true
	validates :meter_id, presence: true
	validates :patient_id, presence:true

	belongs_to :communication_device
	belongs_to :meter
	belongs_to :patient
end
