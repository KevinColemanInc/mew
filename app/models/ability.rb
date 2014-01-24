class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # a signed-in user can do everything
     
    if user.is_a? CaseManager
      can :read, User
      can :manage, Member
      
      if user.has_role? :case_manager_admin
          can :manage, CaseManager
      else
          can :read, CaseManager
      end

      can :manage, CommunicationDevice
      can :manage, Measurement
      can :manage, Meter
      can :manage, MemberGroup
      
    elsif user.is_a? Member
      can :read, User
      can :read, Measurement, :user_id => user.id
    end
    
  end
end
