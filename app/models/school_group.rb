# == Schema Information
#
# Table name: school_groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SchoolGroup < ApplicationRecord
  include SearchCop

  # Validações
  validates :name, :identifier, presence: true

  # Associações
  has_many :incidents

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name
  end

  # Retorna um vetor contendo as identificacoes das classes
  #
  # @return [Array] contendo as identificacoes
  def self.identifiers
    all.collect {|p| [ p.identifier] }
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de funções
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Nome",'name'], ["Identificador",'identifier']]
  end
end
