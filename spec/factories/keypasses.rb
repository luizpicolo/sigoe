# == Schema Information
#
# Table name: keypasses
#
#  id            :integer          not null, primary key
#  title         :string
#  key           :string
#  local_service :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user          :string
#  local         :integer
#

FactoryGirl.define do
  factory :keypass do
    title { Faker::Internet.email }
    user { Faker::Internet.user_name }
    key { Faker::Internet.email }
    local_service { Faker::Internet.email }
    local { 'ifms' }
    description { Faker::Internet.email }
  end
end
