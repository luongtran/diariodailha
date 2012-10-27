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
      else
        can :create, Contact
      end
    end
  end

end