# frozen_string_literal: true

# == Schema Information
#
# Table name: incidents
#
#  id               :integer          not null, primary key
#  student_id       :integer
#  user_id          :integer
#  institution      :integer
#  description      :text
#  date_incident    :date
#  soluction        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_id        :integer
#  time_incident    :time
#  assistant_id     :integer
#  signed_in        :datetime
#  is_resolved      :integer
#  type_student     :integer
#  sanction         :integer
#  school_group_id  :integer
#  type_incident_id :integer
#

FactoryBot.define do
  factory :incident do
    student factory: :student
    user factory: :user
    assistant factory: :user
    course factory: :course
    sector_id factory: :sector
    type_incident factory: :type_incident
    institution { 'Ifms' }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    date_incident { Time.zone.now }
    time_incident { '10:00:00' }
    type_student { 'resident' }
    sanction { 'verbal_warning' }
    signed_in { Time.zone.now }
    visibility { 'public' }
    soluction { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
