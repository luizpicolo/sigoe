# frozen_string_literal: true

# == Schema Information
#
# Table name: prohibition_and_responsibilities
#
#  id         :integer          not null, primary key
#  item       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Incident::ProhibitionAndResponsibility < ApplicationRecord
  self.table_name = 'prohibition_and_responsibilities'

  # Validações
  validates :item, presence: true

  # Associações
  has_and_belongs_to_many :incidents
end
