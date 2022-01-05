# frozen_string_literal: true

# == Schema Information
#
# Table name: school_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  polo_id    :integer
#  old_id     :integer
#

FactoryBot.define do
  factory :school_group do
    name { Faker::Name.name }
    identifier { '12345' }
    polo factory: :polo
  end
end
