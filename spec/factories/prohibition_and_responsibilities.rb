# == Schema Information
#
# Table name: prohibition_and_responsibilities
#
#  id         :integer          not null, primary key
#  item       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

FactoryBot.define do
  factory :prohibition_and_responsibility do
    item { 'MyString' }
  end
end
