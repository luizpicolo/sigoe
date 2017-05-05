# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  from        :string
#  to          :string
#  subject     :string
#  priority    :integer          default("0")
#  description :text
#  status      :integer          default("0")
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  local       :integer
#  answer      :integer
#

FactoryGirl.define do
  factory :ticket do
    from "MyString"
    to "MyString"
    subject "MyString"
    priority ""
    description "MyText"
    status ""
    user nil
  end
end
