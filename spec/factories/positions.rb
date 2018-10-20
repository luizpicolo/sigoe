# == Schema Information
#
# Table name: positions
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :position do
    name { Faker::Name.name }
  end
end
