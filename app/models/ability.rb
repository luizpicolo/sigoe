# Permite ou restringe acesso a determinadas funcionalidades do sistema
#
# @see https://github.com/ryanb/cancan/wiki/defining-abilities
class Ability
  include CanCan::Ability

  # Método para inicializar as configurações de permissão ou restrição
  def initialize(user)
    user ||= User.new

    if user.it_is_part_of_the_sector?('serti')
      can :manage, :all
      can :access, :rails_admin
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
