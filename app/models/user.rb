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
#  course_id              :bigint(8)
#  admin                  :boolean          default(FALSE)
#

class User < ApplicationRecord
  mount_uploader :avatar, UserUploader
  include SearchCop

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  # Validações
  validates :username, presence: true

  # Associações
  has_many :permissions, dependent: :destroy
  belongs_to :course, optional: true

  # Nested form
  accepts_nested_attributes_for :permissions

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name, :email, :siape
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de usuários
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [%w[ID id], %w[Nome name]]
  end

  # Verifica se o usuário selecionado é o usuário que esta logado
  #
  # @param [Object User] current_user
  # @return [Boolean] true se o usuário for igual ao usuário logo
  # @return [Boolean] false se o usuário for diferente ao usuário logo
  def is_current?(current_user)
    current_user.id == id
  end

  # Retorna um vetor contendo os nomes e seus respectivos IDs
  #
  # @return [Array] contendo nomes e seus IDs
  def self.get_all
    order('name asc').collect { |p| [p.name, p.id] }
  end

  def last_access
    updated_at.strftime('%d/%m/%Y %H:%M')
  end
end
