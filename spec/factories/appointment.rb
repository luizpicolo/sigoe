# == Schema Information
#
# Table name: patient_appointments
#
#  id                            :integer          not null, primary key
#  patient_id                    :integer
#  companion                     :string
#  medical_referral              :integer
#  nursing_conduct               :integer
#  previous_medical_consultation :text
#  complaints                    :integer
#  description_complaint         :text
#  weight                        :string
#  height                        :string
#  abdominal_perimeter           :string
#  bloodvpressure                :string
#  temperature                   :string
#  heart_rate                    :string
#  respiratory_frequency         :string
#  blood_glucose                 :string
#  tanners_stage                 :integer
#  diagnosis                     :text
#  prescription                  :text
#  evolution                     :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

FactoryBot.define do
    factory :appointment, class: Patient::Appointment do
       patient factory: :patient
       companion { Faker::Name.name }
       medical_referral { "Hospital" }
       nursing_conduct { "Observação" }
       previous_medical_consultation { Faker::Lorem.paragraph(2) }
       complaints  { "Febre" }
       description_complaint { Faker::Lorem.paragraph(2) }
       weight { "100" }
       height { "100" }
       abdominal_perimeter { "100" }
       bloodvpressure { "100" }
       temperature { "100" }
       heart_rate  { "100" }
       respiratory_frequency { "100" }
       blood_glucose { "100" }
       tanners_stage { "Estágio II" }
       diagnosis { Faker::Lorem.paragraph(2) }
       prescription { Faker::Lorem.paragraph(2) }
       evolution { Faker::Lorem.paragraph(2) }
    end
end
