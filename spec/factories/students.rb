# == Schema Information
#
# Table name: students
#
#  id                  :integer          not null, primary key
#  name                :string
#  course_id           :integer
#  photo               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  responsible         :string
#  responsible_contact :string
#  contact             :string
#  ra                  :integer
#  password            :string
#  password_digest     :string
#  enrollment          :string
#  cpf                 :string
#  birth_date          :date
#  course_situation    :integer
#

FactoryBot.define do
  factory :student do
    pwd = Faker::Internet.password
    name { Faker::Name.name }
    course factory: :course
    ra { '12345678' }
    photo { Faker::Placeholdit.image }
    responsible { Faker::Name.name }
    responsible_contact { Faker::Internet.email }
    contact { Faker::Internet.email }
    password { pwd }
    password_confirmation { pwd }
  end
end
