# == Schema Information
#
# Table name: permissions
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  entity      :string
#  can_create  :boolean          default(FALSE)
#  can_read    :boolean          default(FALSE)
#  can_update  :boolean          default(FALSE)
#  can_destroy :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  can_manage  :boolean          default(FALSE)
#  can_extras  :boolean          default(FALSE)
#

FactoryBot.define do
  factory :permission do
    user factory: :user
    entity { "MyString" }
    can_create { true }
    can_read { true }
    can_update { true }
    can_destroy { true }
    can_manage { true }
    can_extras { true }
  end
end
