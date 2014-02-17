class Meter < ActiveRecord::Base
	validates :mid, presence: true
	validates :bluetooth_mac, presence: true, format: { with: /\A[[a-zA-Z0-9]{2}:]{17}\z/ } 
  validates :model, presence: true
  validates :display_name, presence: true
  
	has_many :measurements
end
