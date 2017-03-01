FactoryGirl.define do
  factory :ticket do
    from "MyString"
    to "MyString"
    subject "MyString"
    priority ""
    description "MyText"
    status ""
    user nil
  end
end
