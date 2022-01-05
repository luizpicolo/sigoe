# frozen_string_literal: true

# == Schema Information
#
# Table name: student_duties
#
#  id         :integer          not null, primary key
#  item       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Incident::StudentDuty < ApplicationRecord
  self.table_name = 'student_duties'

  # Validações
  validates :item, presence: true

  # Associações
  has_and_belongs_to_many :incidents
end
