# Permite ou restringe acesso a determinadas funcionalidades do sistema
#
# @see https://github.com/ryanb/cancan/wiki/defining-abilities
class Ability
  include CanCan::Ability

  # Método para inicializar as configurações de permissão ou restrição
  def initialize(user)
    user ||= User.new

    # Assistente de alunos
    if user.it_is_part_of_the_sector?('assal')
      can :manage, Incident
    end

    # Audio visual
    if user.it_is_part_of_the_sector?('audi')
      can :manage, Student
    end

    # Diretoria de ensino
    if user.it_is_part_of_the_sector?('diren')
      can :manage, Student
      can :manage, Course
      can :manage, Incident
    end

    # Professores
    if user.it_is_part_of_the_sector?('prof')
      can :read, Student
    end

    # admins
    if user.it_is_part_of_the_sector?('serti')
      can :manage, :all
    end

    # Tecnicos de Lab em Informatica
    if user.it_is_part_of_the_sector?('teclabinf')
      can :read, Keypass
    end
  end
end
