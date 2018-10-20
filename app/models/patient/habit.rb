# == Schema Information
#
# Table name: patient_habits
#
#  id                       :bigint(8)        not null, primary key
#  patient_id               :bigint(8)
#  sleep_rest               :integer
#  amount_sleep_hours       :integer
#  physical_activity        :integer
#  amount_physical_activity :integer
#  amount_fruit_vegetable   :integer
#  amount_red_meat          :integer
#  amount_white_meat        :integer
#  amount_juice             :integer
#  amount_water             :integer
#  amount_tea               :integer
#  other_information        :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Patient::Habit < ApplicationRecord
  # Validações
  # validates :patient, presence: true

  enum sleep_rest: ['Alterado', 'Satisfatório']

  belongs_to :patient
end
