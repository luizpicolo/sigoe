# /app/models/user.rb
# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  name                   :string
#  siape                  :integer
#  avatar                 :string
#  course_id              :integer
#  admin                  :boolean          default(false)
#  status                 :boolean          default(true)
#  polo_id                :integer
#  old_id                 :integer
#
# Indexes:
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  mount_uploader :avatar, UserUploader
  include SearchCop

  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Validações
  validates :username, presence: true, uniqueness: true

  # Associações
  has_many :permissions, dependent: :destroy
  belongs_to :course, optional: true
  belongs_to :polo, optional: true

  # Permite atributos aninhados para o formulário de permissões
  accepts_nested_attributes_for :permissions

  # Configuração do SearchCop para busca
  search_scope :search do
    attributes :name, :email, :siape
  end

  # Define os atributos para ordenação nas listagens de usuários
  # @return [Array<Array<String>>] um array contendo pares de nome e atributo para ordenação
  def self.ordenation_attributes
    [%w[ID id], %w[Nome name]]
  end

  # Verifica se o usuário é o mesmo que está logado
  # @param current_user [User] o usuário atualmente logado
  # @return [Boolean] true se o usuário é o mesmo que está logado, false caso contrário
  def is_current?(current_user)
    current_user&.id == id
  end

  # Retorna um array com os nomes e IDs de todos os usuários, opcionalmente filtrados
  # @param params_return [Hash] um hash de parâmetros para filtrar os usuários
  # @return [Array<Array<String, Integer>>] um array contendo pares de nome e ID dos usuários
  def self.get_all(params_return = {})
    where(params_return).order(name: :asc).pluck(:name, :id)
  end

  # Retorna a data do último acesso formatada
  # @return [String] a data do último acesso formatada como "dia/mês/ano hora:minuto"
  def last_access
    updated_at&.strftime('%d/%m/%Y %H:%M')
  end

  # Retorna o nome do campus (polo) associado ao usuário
  # @return [String, nil] o nome do campus ou nil se não houver polo associado
  def campus
    polo&.name
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if username = conditions.delete(:username)
      where(conditions).where(['username = :value', { value: username }]).first
    else
      where(conditions).first
    end
  end
end
