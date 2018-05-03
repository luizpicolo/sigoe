class CreatePatientIncidents < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_incidents do |t|

      t.string :companion
      t.integer :medical_referral
      t.integer :nursing_conduct
      t.text :previous_medical_consultation

      t.timestamps
    end
  end
end
