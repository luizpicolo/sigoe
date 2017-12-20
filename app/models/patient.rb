class Patient < ApplicationRecord
  belongs_to :student
  has_many :habits

  include SearchCop

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens dos pacientes
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Nome",'name']]
  end
end
