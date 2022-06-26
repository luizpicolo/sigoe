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
  has_many :sectors

  # Retorna um vetor contendo as initiais e seus respectivos IDs
  #
  # @return [Array] contendo as iniciais dos cursos e seus IDs
  def self.initials(user)
    if user.super_admin
      order('name asc').collect { |p| [p.name, p.id] }
    else
      where(id: user.polo.id).collect { |p| [p.name, p.id] }
    end
  end
end
