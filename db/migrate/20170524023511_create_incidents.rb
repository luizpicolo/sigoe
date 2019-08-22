# frozen_string_literal: true

class CreateIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :incidents do |t|
      t.references :student, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.integer :local, index: true
      t.text :description
      t.date :date_incident, index: true
      t.text :soluction

      t.timestamps
    end
  end
end
