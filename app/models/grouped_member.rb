class GroupedMember < ActiveRecord::Base
  validate :member_id, presence: true
  validate :member_group_id, presence: true
  
	belongs_to :member
	belongs_to :member_group
end
