# == Schema Information
#
# Table name: patients
#
#  id         :bigint(8)        not null, primary key
#  student_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :patient do
    student factory: :student
    habits_attributes { attributes_for(:habit) }
    morbids_attributes { attributes_for(:morbid) }
    physiologicals_attributes { attributes_for(:physiological) }
    appointments_attributes { attributes_for(:appointment) }
  end
end
