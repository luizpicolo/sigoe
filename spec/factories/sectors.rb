# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  initial    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  icon       :string
#

# SERTI, AUDI, DIREN
FactoryGirl.define do
  factory :sector do
    name { Faker::Name.name }
    initial 'SERTI'
  end
end
