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

FactoryBot.define do
  factory :morbid, class: Patient::Morbid do
    patient factory: :patient
    pre_existing_diseases_vascular_accident { "Yes" }
    pre_existing_diseases_cancer { "Yes" }
    pre_existing_diseases_hypertension { "Yes" }
    pre_existing_diseases_cardiopathy { "Doenças no miocárdio" }
    pre_existing_diseases_diabetes { "Tipo I" }
    pre_existing_diseases_renal { "Cálculos renais" }
    pre_existing_diseases_pneumopathy { "Pneumopatia Intersticial" }
    others_pre_existing_diseases { "Text" }
    allergies_drugs { "Yes" }
    allergies_foods { "Yes" }
    allergies_cosmetics { "Yes" }
    allergies_plaster { "Yes" }
    allergies_wool { "Yes" }
    others_allergies { "Text" }
    risk_factors_smoking { "Yes" }
    risk_factors_ethicism { "Yes" }
    risk_factors_chemotherapy { "Yes" }
    risk_factors_radiotherapy { "Yes" }
    risk_factors_chemical_dependency { "Yes" }
    risk_factors_violence { "Yes" }
    others_risk_factors { "Text" }
  end
end
