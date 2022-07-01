FactoryBot.define do
  factory :sector do
    name { "sector" }
    email { "sector@email.com" }
    polo factory: :polo
  end
end
