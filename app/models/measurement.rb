class Measurement < ActiveRecord::Base
	belongs_to :communication_device
	belongs_to :meter
	belongs_to :patient
end
