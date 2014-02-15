class ManagedMember < ActiveRecord::Base
  validates :case_manager_id, presence: true
  validates :member_id, presence:true
  
  validates_uniqueness_of :member_id, :scope => :case_manager_id
  
  belongs_to :case_manager
  belongs_to :member

  before_save :remove_primary_for_other_cm
  
  private
  def remove_primary_for_other_cm
      ManagedMember.where(member: self.member).update_all("primary = 'false'") if self.primary
  end
end
