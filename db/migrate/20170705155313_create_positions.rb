# frozen_string_literal: true

class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
