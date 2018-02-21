# == Schema Information
#
# Table name: morbids
#
#  id                                      :integer          not null, primary key
#  patient_id                              :integer
#  pre_existing_diseases_vascular_accident :string
#  pre_existing_diseases_cancer            :string
#  pre_existing_diseases_hypertension      :string
#  pre_existing_diseases_cardiopathy       :integer
#  pre_existing_diseases_diabetes          :integer
#  pre_existing_diseases_renal             :integer
#  pre_existing_diseases_pneumopathy       :integer
#  others_pre_existing_diseases            :text
#  allergies_drugs                         :string
#  allergies_foods                         :string
#  allergies_cosmetics                     :string
#  allergies_plaster                       :string
#  allergies_wool                          :string
#  others_allergies                        :text
#  risk_factors_smoking                    :string
#  risk_factors_ethicism                   :string
#  risk_factors_chemotherapy               :string
#  risk_factors_radiotherapy               :string
#  risk_factors_chemical_dependency        :string
#  risk_factors_violence                   :string
#  others_risk_factors                     :text
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#

require 'rails_helper'

RSpec.describe Morbid, type: :model do

  # Relations
  it { is_expected.to belong_to :patient }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :patient_id }
  it { is_expected.to have_db_column :pre_existing_diseases_vascular_accident }
  it { is_expected.to have_db_column :pre_existing_diseases_cancer }
  it { is_expected.to have_db_column :pre_existing_diseases_hypertension }
  it { is_expected.to have_db_column :pre_existing_diseases_cardiopathy }
  it { is_expected.to have_db_column :pre_existing_diseases_diabetes }
  it { is_expected.to have_db_column :pre_existing_diseases_renal }
  it { is_expected.to have_db_column :pre_existing_diseases_pneumopathy }
  it { is_expected.to have_db_column :others_pre_existing_diseases }
  it { is_expected.to have_db_column :allergies_drugs }
  it { is_expected.to have_db_column :allergies_foods }
  it { is_expected.to have_db_column :allergies_cosmetics }
  it { is_expected.to have_db_column :allergies_plaster }
  it { is_expected.to have_db_column :allergies_wool }
  it { is_expected.to have_db_column :others_allergies }
  it { is_expected.to have_db_column :risk_factors_smoking }
  it { is_expected.to have_db_column :risk_factors_ethicism }
  it { is_expected.to have_db_column :risk_factors_chemotherapy }
  it { is_expected.to have_db_column :risk_factors_radiotherapy }
  it { is_expected.to have_db_column :risk_factors_chemical_dependency }
  it { is_expected.to have_db_column :risk_factors_violence }
  it { is_expected.to have_db_column :others_risk_factors }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :patient }

  # === Enums ===
  it { is_expected.to define_enum_for(:pre_existing_diseases_cardiopathy).with(["Cardiopatia congênita", "Doenças no miocárdio", "Infecção no coração", "Cardiopatia de válvulas", "Cardiopatia hipertensiva", "Cardiopatia Isquêmica"]) }
  it { is_expected.to define_enum_for(:pre_existing_diseases_diabetes).with(["Tipo I", "Tipo II"]) }
  it { is_expected.to define_enum_for(:pre_existing_diseases_renal).with(["Cálculos renais", "Infecção renal ou Pielonefrite", "Cistos renais", "Perda da função renal"]) }
  it { is_expected.to define_enum_for(:pre_existing_diseases_pneumopathy).with(["Pneumopatia Intersticial", "Pneumopatia Aguda", "Pneumopatia Crônica", "Pneumopatia Ocupacional", "Pneumopatia Parasitária"]) }

end
