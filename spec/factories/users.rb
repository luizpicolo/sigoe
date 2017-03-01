FactoryGirl.define do
  factory :user do
    pwd = Faker::Internet.password
    email { Faker::Internet.email }
    password pwd
    password_confirmation pwd
    admin true
  end
end
