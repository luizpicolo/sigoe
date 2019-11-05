# frozen_string_literal: true

class CreateProhibitionAndResponsibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :prohibition_and_responsibilities do |t|
      t.string :item

      t.timestamps
    end
  end
end
