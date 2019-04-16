class ProhibitionAndResponsibility < ApplicationRecord
  # Validações
  validates :item, presence: true
  
  # Associações
  has_and_belongs_to_many :incidents
end
