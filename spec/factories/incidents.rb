FactoryGirl.define do
  factory :incident do
    student nil
    user nil
    local 1
    description "MyText"
    data_incident "2017-05-23"
    soluction "MyText"
  end
end
