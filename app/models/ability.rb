class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.it_is_part_of_the_sector?('serti')
      can :manage, User
      can :access, :rails_admin
      can :manage, Keypass
      can :manage, Student
      can :manage, Course
      can :manage, Sector
    end

    if user.it_is_part_of_the_sector?('audi')
      can :manage, Student
    end

    if user.it_is_part_of_the_sector?('prof')
      can :read, Student
    end

    if user.it_is_part_of_the_sector?('diren')
      can :manage, Student
      can :manage, Course
    end
  end
end
