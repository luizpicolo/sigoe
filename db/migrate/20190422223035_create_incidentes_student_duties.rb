class CreateIncidentesStudentDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents_student_duties do |t|
      t.integer :incident_id
      t.integer :student_duty_id
    end
  end
end
