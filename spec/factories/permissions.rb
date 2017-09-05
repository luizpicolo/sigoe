# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  entity      :string
#  can_create  :boolean          default(FALSE)
#  can_read    :boolean          default(FALSE)
#  can_update  :boolean          default(FALSE)
#  can_destroy :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :permission do
    user factory: :user
    entity "MyString"
    can_create true
    can_read true
    can_update true
    can_destroy true
  end
end
