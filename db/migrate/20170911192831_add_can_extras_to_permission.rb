# frozen_string_literal: true

class AddCanExtrasToPermission < ActiveRecord::Migration[5.1]
  def change
    add_column :permissions, :can_extras, :boolean, default: false
  end
end
