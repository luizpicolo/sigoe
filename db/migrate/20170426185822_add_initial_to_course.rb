# frozen_string_literal: true

class AddInitialToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :initial, :string
  end
end
