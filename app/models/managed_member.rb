class ManagedMember < ActiveRecord::Base
  validates :case_manager_id, presence: true
  validates :member_id, presence:true
  
  belongs_to :case_manager
  belongs_to :member
end
