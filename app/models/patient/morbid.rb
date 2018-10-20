# == Schema Information
#
# Table name: patient_morbids
#
#  id                                      :bigint(8)        not null, primary key
#  patient_id                              :bigint(8)
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

class Patient::Morbid < ApplicationRecord
  # Validações
  # validates :patient, presence: true

  belongs_to :patient

  enum pre_existing_diseases_cardiopathy: [
    'Cardiopatia congênita', 'Doenças no miocárdio', 'Infecção no coração',
    'Cardiopatia de válvulas', 'Cardiopatia hipertensiva',
    'Cardiopatia Isquêmica'
  ]
  enum pre_existing_diseases_diabetes: ['Tipo I', 'Tipo II']
  enum pre_existing_diseases_renal: ['Cálculos renais',
    'Infecção renal ou Pielonefrite', 'Cistos renais', 'Perda da função renal'
  ]
  enum pre_existing_diseases_pneumopathy: ['Pneumopatia Intersticial',
    'Pneumopatia Aguda', 'Pneumopatia Crônica', 'Pneumopatia Ocupacional',
    'Pneumopatia Parasitária'
  ]
end
