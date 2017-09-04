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
#  is_resolved   :integer
#  type_student  :integer
#  sanction      :integer
#

FactoryGirl.define do
  factory :incident do
    student factory: :student
    user factory: :user
    assistant factory: :user
    course factory: :course
    institution { 'Ifms' }
    description { Faker::Lorem.paragraph(2) }
    date_incident Time.zone.now
    time_incident '10:00:00'
    type_student { 'resident' }
    signed_in Time.zone.now
    soluction { Faker::Lorem.paragraph(2) }
  end
end
