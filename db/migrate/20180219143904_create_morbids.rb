class CreateMorbids < ActiveRecord::Migration[5.1]
  def change
    create_table :morbids do |t|
      t.references :patient, foreign_key: true, index: true
      t.string :pre_existing_diseases_vascular_accident
      t.string :pre_existing_diseases_cancer
      t.string :pre_existing_diseases_hypertension
      t.integer :pre_existing_diseases_cardiopathy
      t.integer :pre_existing_diseases_diabetes
      t.integer :pre_existing_diseases_renal
      t.integer :pre_existing_diseases_pneumopathy
      t.text :others_pre_existing_diseases
      t.string :allergies_drugs
      t.string :allergies_foods
      t.string :allergies_cosmetics
      t.string :allergies_plaster
      t.string :allergies_wool
      t.text :others_allergies
      t.string :risk_factors_smoking
      t.string :risk_factors_ethicism
      t.string :risk_factors_chemotherapy
      t.string :risk_factors_radiotherapy
      t.string :risk_factors_chemical_dependency
      t.string :risk_factors_violence
      t.text :others_risk_factors

      t.timestamps
    end
  end
end
