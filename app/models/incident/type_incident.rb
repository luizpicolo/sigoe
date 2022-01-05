# frozen_string_literal: true

# == Schema Information
#
# Table name: type_incidents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  old_id     :integer
#

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
