class Meter < ActiveRecord::Base
	validates :mid, presence: true
	validates :bluetooth_mac, presence: true, format: { with: /\A[[a-zA-Z0-9]{2}:]{17}\z/ } 

	has_many :measurements
	has_and_belongs_to_many :communication_device
end
