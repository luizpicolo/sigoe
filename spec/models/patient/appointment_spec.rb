# == Schema Information
#
# Table name: patient_appointments
#
#  id                            :bigint(8)        not null, primary key
#  patient_id                    :bigint(8)
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

require 'rails_helper'

RSpec.describe Patient::Appointment, type: :model do

  # === Relations ===
  it { should belong_to :patient }

  # === Database (Columns) ===
  it { should have_db_column :id }
  it { should have_db_column :patient_id }
  it { should have_db_column :companion }
  it { should have_db_column :medical_referral }
  it { should have_db_column :nursing_conduct }
  it { should have_db_column :previous_medical_consultation }
  it { should have_db_column :complaints }
  it { should have_db_column :description_complaint }
  it { should have_db_column :weight }
  it { should have_db_column :height }
  it { should have_db_column :abdominal_perimeter }
  it { should have_db_column :bloodvpressure }
  it { should have_db_column :temperature }
  it { should have_db_column :heart_rate }
  it { should have_db_column :respiratory_frequency }
  it { should have_db_column :blood_glucose }
  it { should have_db_column :tanners_stage }
  it { should have_db_column :diagnosis }
  it { should have_db_column :prescription }
  it { should have_db_column :evolution }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }

  # === Database (Indexes) ===
  it { should have_db_index ["patient_id"] }

  # === Enums ===
  it { should define_enum_for(:complaints).with(["Exame Preventivo", "Febre", "Picada Insetos", "Geniturinária", "Orientação", "Ocular/Auricular", "Cólica Mestrual", "Lesão", "Gastrintestinal", "Tontura/Mal Estar", "Cefaléia"]) }
  it { should define_enum_for(:medical_referral).with(["Hospital", "ESF", "Família", "Psicóloga"]) }
  it { should define_enum_for(:nursing_conduct).with(["Orientações", "Observação", "Encaminhamentos"]) }
  it { should define_enum_for(:tanners_stage).with(["Estágio I", "Estágio II", "Estágio III", "Estágio IV", "Estágio V"]) }
end
