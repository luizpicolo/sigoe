# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  initial    :string
#

class Course < ApplicationRecord
  include SearchCop

  # Validações
  validates :name, :initial, presence: true, uniqueness: true

  # Associações
  has_many :students
  has_many :incidents

  search_scope :search do
    attributes :name
  end

  # Retorna um vetor contendo os nomes e seus respectivos IDs
  #
  # @return [Array] contendo os nomes e seus IDs
  def self.names
    all.collect {|p| [ p.name, p.id ] }
  end

  # Retorna um vetor contendo as initiais e seus respectivos IDs
  #
  # @return [Array] contendo as iniciais dos cursos e seus IDs
  def self.initials
    order('initial asc').collect {|p| [ p.initial, p.id ] }
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens dos cursos
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'],["Nome",'name'],["Sigla",'initial']]
  end

  # Retorna um Hash contendo os dados para a listagem dos alunos segunda a
  # turma
  #
  # @return [HASH] com chave para a ordem, quantidade de retorno e item a ser buscado
  def params_search
    { order: 'name', return: 100, search: initial.downcase }
  end
end
