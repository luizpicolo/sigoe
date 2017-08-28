class Permission < ApplicationRecord
  belongs_to :user

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de usuários
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["User",'user']]
  end
end
