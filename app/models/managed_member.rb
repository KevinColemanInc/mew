class ManagedMember < ActiveRecord::Base
  validates :case_manager_id, presence: true
  validates :member_id, presence:true
  
  validates_uniqueness_of :member_id, :scope => :case_manager_id
  
  belongs_to :case_manager
  belongs_to :member
end
