class AddTypeIncidentToIncident < ActiveRecord::Migration[5.2]
  def change
    add_reference :incidents, :type_incident, foreign_key: true, index: true
  end
end
