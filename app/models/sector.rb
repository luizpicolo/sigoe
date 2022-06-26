class Sector < ApplicationRecord
  belongs_to :polo

  # Retorna um vetor contendo os setores em curso com os nomes e seus respectivos IDs
  #
  # @return [Array] contendo nomes e seus IDs
  def self.get_all(params_return)
    where(params_return).order('name asc').collect { |p| [p.name, p.id] }
  end
end
