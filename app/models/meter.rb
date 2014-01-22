class Meter < ActiveRecord::Base
	validates :mid, presence: true
	validates :bluetooth_mac, presence: true

	has_many :measurements
	has_and_belongs_to_many :patients
	has_and_belongs_to_many :communication_device
end
