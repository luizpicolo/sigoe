class AddIndexToTableIncidents < ActiveRecord::Migration[7.0]
  def change
    add_index :incidents, :assistant_id
    add_index :incidents, :school_group_id
    add_index :incidents_prohibition_and_responsibilities, :incident_id
    add_index :incidents_prohibition_and_responsibilities, :prohibition_and_responsibility_id, name: 'prohibition_index'
    add_index :incidents_student_duties, :incident_id
    add_index :incidents_student_duties, :student_duty_id
  end
end
