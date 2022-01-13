# frozen_string_literal: true

# == Schema Information
#
# Table name: polos
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  institution_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  inicial        :string
#

class Polo < ApplicationRecord
  belongs_to :institution

  # Retorna um vetor contendo as initiais e seus respectivos IDs
  #
  # @return [Array] contendo as iniciais dos cursos e seus IDs
  def self.initials
    order('name asc').collect { |p| [p.name, p.id] }
  end
end
