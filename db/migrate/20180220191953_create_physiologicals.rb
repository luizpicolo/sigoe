# frozen_string_literal: true

class CreatePhysiologicals < ActiveRecord::Migration[5.1]
  def change
    create_table :physiologicals do |t|
      t.references :patient, foreign_key: true, index: true
      t.text :other_diseases
      t.text :continuing_medication
      t.text :previous_surgeries
      t.text :hospitalization
      t.text :first_menstruation
      t.text :complaints
      t.text :gestation
      t.text :children
      t.text :abortion

      t.timestamps
    end
  end
end
