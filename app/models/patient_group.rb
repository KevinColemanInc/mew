class PatientGroup < ActiveRecord::Base
	has_and_belongs_to_many :patients
	has_and_belongs_to_many :case_managers
end
