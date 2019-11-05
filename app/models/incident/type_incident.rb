# frozen_string_literal: true

class Incident::TypeIncident < ApplicationRecord
  self.table_name = 'type_incidents'

  # Validações
  validates :name, presence: true

  # Associações
  has_many :incidents

  # Retorna um vetor contendo os nomes e seus respectivos IDs
  #
  # @return [Array] contendo nomes e seus IDs
  def self.get_all
    order('name asc').collect { |p| [p.name, p.id] }
  end
end
