class Meter < ActiveRecord::Base
	validates :mid, presence: true
	validates :bluetooth_mac, presence: true, format: { with: /\A[[a-zA-Z0-9]{2}:]{17}\z/ } 

	has_many :measurements
end
