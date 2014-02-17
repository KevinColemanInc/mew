class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # a signed-in user can do everything
     
    if user.is_a? CaseManager
      if user.has_role? :case_manager_admin
          can :manage, CaseManager
      else
          can :read, CaseManager
      end

      can :manage, CommunicationDevice
      can :manage, EmailMessage

      can :manage, GroupedMember
      can :manage, ManagedMember

      can :manage, Measurement
      can :manage, MemberGroup

      can :manage, Member
      can :manage, Meter
      
    elsif user.is_a? Member
      can :read, User, id: user.id
      can :create, Meter
      can [:create, :read], Measurement, member_id: user.id, archived_at: nil
      can [:create, :show], CommunicationDevice
    end
    
  end
end
