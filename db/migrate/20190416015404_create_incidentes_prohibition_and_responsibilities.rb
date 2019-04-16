class CreateIncidentesProhibitionAndResponsibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents_prohibition_and_responsibilities do |t|
      t.integer :incident_id
      t.integer :prohibition_and_responsibility_id
    end
  end
end
