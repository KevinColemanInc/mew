class Meter < ActiveRecord::Base
	has_many :measurements
	has_and_belongs_to_many :patients
	has_and_belongs_to_many :communication_device
end
