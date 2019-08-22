# frozen_string_literal: true

class AddCanManageToPermission < ActiveRecord::Migration[5.1]
  def change
    add_column :permissions, :can_manage, :boolean, default: false
  end
end
