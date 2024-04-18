# frozen_string_literal: true

# Permite ou restringe acesso a determinadas funcionalidades do sistema
#
# @see https://github.com/ryanb/cancan/wiki/defining-abilities
class Ability
  include CanCan::Ability

  # Método para inicializar as configurações de permissão ou restrição
  def initialize(user)
    user ||= User.new

    can [:manage], :all if user.admin?
    user.permissions.each do |permission|
      # Permissões extras para ocorrências
      if permission.can_extras?
        can [:sanction], eval(permission.entity) if permission.can_extras?
        can [:confirmation], eval(permission.entity) if permission.can_extras?
        can [:sign], eval(permission.entity) if permission.can_extras?
      end
      can [:create], eval(permission.entity) if permission.can_create?
      can [:read_restricted], eval(permission.entity) if permission.can_read_restricted?
      can [:export_to_academic_system], eval(permission.entity) if permission.can_export_to_academic_system?
      can [:read], eval(permission.entity) if permission.can_read?
      can [:update], eval(permission.entity) if permission.can_update?
      can [:destroy], eval(permission.entity) if permission.can_destroy?
    end
  end
end
