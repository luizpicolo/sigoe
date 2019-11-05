# frozen_string_literal: true

class AddTimeIncidentToIncident < ActiveRecord::Migration[5.0]
  def change
    add_column :incidents, :time_incident, :time
  end
end
