FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-05-17 18:23:32" }
  end
end
