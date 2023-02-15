# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  name                   :string
#  siape                  :integer
#  avatar                 :string
#  course_id              :integer
#  admin                  :boolean          default("false")
#  status                 :boolean          default("true")
#  polo_id                :integer
#  old_id                 :integer
#

FactoryBot.define do
  factory :user do
    pwd = Faker::Internet.password
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { pwd }
    password_confirmation { pwd }
    username { Faker::Internet.user_name }
    siape { Faker::Number.number(digits: 7) }
    status { true }
    polo factory: :polo
    admin { false }
    super_admin { false }
  end
end
