# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  entity      :string
#  can_create  :boolean          default("false")
#  can_read    :boolean          default("false")
#  can_update  :boolean          default("false")
#  can_destroy :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  can_manage  :boolean          default("false")
#  can_extras  :boolean          default("false")
#

FactoryBot.define do
  factory :permission do
    user factory: :user
    entity { 'MyString' }
    can_create { true }
    can_read { true }
    can_update { true }
    can_destroy { true }
    can_manage { true }
    can_extras { true }
  end
end
