class PatientGroup < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	
	has_and_belongs_to_many :patients
	has_and_belongs_to_many :case_managers
end
