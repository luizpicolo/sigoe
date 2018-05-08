class CreatePatientIncidents < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_incidents do |t|
      t.references :patient, foreign_key: true, index: true
      t.string :companion
      t.integer :medical_referral
      t.integer :nursing_conduct
      t.text :previous_medical_consultation
      t.integer :complaints
      t.text :description_complaint
      t.string :weight
      t.string :height
      t.string :abdominal_perimeter
      t.string :bloodvpressure
      t.string :temperature
      t.string :heart_rate
      t.string :respiratory_frequency
      t.string :blood_glucose
      t.integer :tanners_stage
      t.text :diagnosis
      t.text :prescription
      t.text :evolution

      t.timestamps
    end
  end
end
