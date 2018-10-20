# == Schema Information
#
# Table name: positions
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Position < ApplicationRecord
  include SearchCop

  # Validações
  validates :name, presence: true

  # Associações
  has_many :users

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name
  end

  # Retorna um vetor contendo os cargos
  #
  # @return [Array] contendo os nomes e seus IDs
  def self.get_all
    all.collect {|p| [ p.name, p.id ] }
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de funções
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Nome",'name']]
  end
end
