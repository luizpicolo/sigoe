# frozen_string_literal: true

class Incident::ProhibitionAndResponsibility < ApplicationRecord
  self.table_name = 'prohibition_and_responsibilities'

  # Validações
  validates :item, presence: true

  # Associações
  has_and_belongs_to_many :incidents
end
