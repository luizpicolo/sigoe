# frozen_string_literal: true

class AddIconToSector < ActiveRecord::Migration[5.0]
  def change
    add_column :sectors, :icon, :string
  end
end
