# frozen_string_literal: true

class AddPositionToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :position, foreign_key: true, index: true
  end
end
