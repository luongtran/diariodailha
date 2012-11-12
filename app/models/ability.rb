class Ability
  include CanCan::Ability

  def initialize(user)
    if (user != nil)
      if (user.is_admin?)
        can :manage, Contact
        can :manage, Content
        can :manage, ContactType
        can :manage, User
        can :manage, Photographer
        can :manage, WorkWithU
        can :manage, :all
      else
        can :create, Contact
        can :read, :all
      end
    end
  end

end