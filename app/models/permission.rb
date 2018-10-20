# == Schema Information
#
# Table name: permissions
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  entity      :string
#  can_create  :boolean          default(FALSE)
#  can_read    :boolean          default(FALSE)
#  can_update  :boolean          default(FALSE)
#  can_destroy :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  can_manage  :boolean          default(FALSE)
#  can_extras  :boolean          default(FALSE)
#

class Permission < ApplicationRecord
  include SearchCop

  # Validações
  validates :user, presence: true

  belongs_to :user

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes user: "user.name"
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de usuários
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["User",'user']]
  end
end
