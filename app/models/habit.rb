class Habit < ApplicationRecord
  enum sleep_rest: ['Alterado', 'Satisfatório']
  # enum physical_activity: ['Sim', 'Não']

  belongs_to :patient
end
