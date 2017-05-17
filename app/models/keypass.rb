# == Schema Information
#
# Table name: keypasses
#
#  id            :integer          not null, primary key
#  title         :string
#  key           :string
#  local_service :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user          :string
#  local         :integer
#

class Keypass < ApplicationRecord
  include SearchCop

  # Validaçôes
  validates :title, presence: true, uniqueness: true
  validates :user, presence: true

  enum local: [:ifms, :ufms, :cemid]

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :title
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens das senhas
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Título",'title'], ["Local",'local'], ["Usuário",'user']]
  end
end
