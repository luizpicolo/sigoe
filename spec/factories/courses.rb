# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  initial    :string
#

FactoryGirl.define do
  factory :course do
    name { Faker::Name.name }
    initial { Faker::Lorem.words(1).first }
  end
end
