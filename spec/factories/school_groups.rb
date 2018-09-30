# == Schema Information
#
# Table name: school_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :school_group do
    name "Name Schollar Group"
    identifier "12345"
  end
end
