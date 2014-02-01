class GroupedMember < ActiveRecord::Base
  validate :member_id, presence: true
  validate :member_group_id, presence: true

  validates_uniqueness_of :member_id, :scope => :member_group_id
  
	belongs_to :member
	belongs_to :member_group

	
end
