# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :patient do
    student factory: :student
    habits_attributes { attributes_for(:habit) }
    morbids_attributes { attributes_for(:morbid) }
  end
end
