# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.references :student, foreign_key: true, index: true

      t.timestamps
    end
  end
end
