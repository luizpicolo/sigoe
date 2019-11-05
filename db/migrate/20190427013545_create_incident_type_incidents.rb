# frozen_string_literal: true

class CreateIncidentTypeIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :type_incidents do |t|
      t.string :name

      t.timestamps
    end
  end
end
