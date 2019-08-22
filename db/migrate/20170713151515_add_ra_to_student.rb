# frozen_string_literal: true

class AddRaToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :ra, :integer
  end
end
