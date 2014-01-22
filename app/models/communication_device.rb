class CommunicationDevice < ActiveRecord::Base
	has_many :measurements
	has_and_belongs_to_many :meters
	has_and_belongs_to_many :patients
end
