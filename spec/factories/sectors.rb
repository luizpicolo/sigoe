# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  initial    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  icon       :string
#

FactoryGirl.define do
  factory :sector do
    name Faker::Lorem.word
    initial Faker::Lorem.words(4)
  end
end
