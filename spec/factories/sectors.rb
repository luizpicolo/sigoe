FactoryGirl.define do
  factory :sector do
    name Faker::Lorem.word
    initial Faker::Lorem.words(4)
  end
end
