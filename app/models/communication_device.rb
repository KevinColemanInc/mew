class CommunicationDevice < ActiveRecord::Base
	validates :cdid, presence: true
	
	has_many :measurements
	has_and_belongs_to_many :meters
	has_and_belongs_to_many :patients
end
