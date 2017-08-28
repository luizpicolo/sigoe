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
