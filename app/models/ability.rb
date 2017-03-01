class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Ticket

    if user.it_is_part_of_the_sector?('serti')
      can :manage, User
      can :access, :rails_admin
      can :manage, Keypass
      can :manage, Student
    end

    if user.it_is_part_of_the_sector?('audi')
      can :manage, Student
    end

    if user.it_is_part_of_the_sector?('diren')
      can :manage, Student
    end

    # if user.it_is_part_of_the_sector?('cogep')
    #   # can :read, User
    # end
  end
end
