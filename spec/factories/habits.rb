# == Schema Information
#
# Table name: habits
#
#  id                       :integer          not null, primary key
#  patient_id               :integer
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

FactoryBot.define do
  factory :habit, class: Patient::Habit do
    patient factory: :patient
    sleep_rest { "Alterado" }
    amount_sleep_hours { "1" }
    physical_activity { "1" }
    amount_physical_activity { "1" }
    amount_fruit_vegetable { "1" }
    amount_red_meat { "1" }
    amount_white_meat { "1" }
    amount_juice { "1" }
    amount_water { "1" }
    amount_tea  { "1" }
    other_information { "Text" }
  end
end
