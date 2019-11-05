# frozen_string_literal: true

class DropTablePosition < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :position, foreign_key: true, index: true
    drop_table :positions
  end
end
