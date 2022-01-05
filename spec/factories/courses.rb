# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  initial    :string
#  polo_id    :integer
#

FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    initial { Faker::Name.name }
    polo factory: :polo
  end
end
