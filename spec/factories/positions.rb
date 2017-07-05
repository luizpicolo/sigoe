# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :position do
    name { Faker::Name.name }
  end
end
