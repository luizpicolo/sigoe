class AddCanManageAllToPermision < ActiveRecord::Migration[5.1]
  def change
    add_column :permissions, :can_manage_all, :boolean, default: false
  end
end
