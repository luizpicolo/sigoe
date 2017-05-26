# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  user_id       :integer
#  local         :integer
#  description   :text
#  date_incident :date
#  soluction     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :incident do
    student factory: :student
    user factory: :user
    course factory: :course
    institution { 'ifms' }
    description { Faker::Lorem.words(255) }
    date_incident Time.now
    time_incident '10:00:00'
    soluction { Faker::Lorem.words(255) }
  end
end
