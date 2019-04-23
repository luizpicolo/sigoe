class Incident::StudentDuty < ApplicationRecord
  self.table_name = "student_duties"

  # Validações
  validates :item, presence: true
  
  # Associações
  has_and_belongs_to_many :incidents
end
