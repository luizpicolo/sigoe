class AddCanReadRestrictedToPermission < ActiveRecord::Migration[7.0]
  def change
    add_column :permissions, :can_read_restricted, :boolean, default: false
  end
end
