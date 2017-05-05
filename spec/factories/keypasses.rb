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
    title "MyString"
    key "MyString"
    local_service "MyString"
    description "MyText"
  end
end
