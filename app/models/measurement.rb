class Measurement < ActiveRecord::Base
  include Archivable
	validates :glucose_value, presence: true, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 500 }
  validates :measured_at, presence: true
  validates :hash, presence: true
	validates :code_number, presence: true
	validates :reading_type, presence: true
	validates :meter_id, presence: true, unless: :case_manager_id
  validates :case_manager_id, presence: true, unless: :meter_id
  validates :member_id, presence: true
  validate :measurement_must_be_unique

	belongs_to :communication_device
	belongs_to :meter
  belongs_to :member
  belongs_to :case_manager

  before_create :set_preferred_meter, :measurement_must_be_unique
  before_validation :set_hash

  def self.mine(user)
  	where(member: user)
  end	

  def set_preferred_meter
    member.update_attributes(preferred_meter_id: self.meter.id) if meter
  end

  private
  def measurement_must_be_unique
    if Measurement.where(token: self.token).count > 0
      errors.add(:token, "must be unique")
    end
  end

  def set_hash
    if self.token.blank?
      self.token = Digest::MD5.hexdigest "#{self.glucose_value}-#{self.measured_at}-#{self.code_number}-#{self.reading_type}-#{self.meter_id}"
    end
  end
  
  def display_name
    "#{glucose_value} mg/dL at #{measured_at.strftime('%-m/%e/%y %l:%M %P')}"
  end

end

