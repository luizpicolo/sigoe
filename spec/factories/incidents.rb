# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  user_id       :integer
#  institution   :integer
#  description   :text
#  date_incident :date
#  soluction     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :integer
#  time_incident :time
#  assistant_id  :integer
#  signed_in     :datetime
#

FactoryGirl.define do
  factory :incident do
    student factory: :student
    user factory: :user
    assistant factory: :user
    course factory: :course
    institution { 'Ifms' }
    description { Faker::Lorem.words(255) }
    date_incident Time.now
    time_incident '10:00:00'
    type_student { 'Residente' }
    signed_in Time.now
    soluction { Faker::Lorem.words(255) }
  end
end
