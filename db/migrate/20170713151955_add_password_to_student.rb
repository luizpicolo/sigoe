# frozen_string_literal: true

class AddPasswordToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :password, :string
  end
end
