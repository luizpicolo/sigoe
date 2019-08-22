# frozen_string_literal: true

class AddCoordenationOfToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :course, foreign_key: true, index: true
  end
end
