# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  course_id  :integer
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    course factory: :course
    photo { Faker::Placeholdit.image }
  end
end
