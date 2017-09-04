class RemoveCanMangeAllToPermission < ActiveRecord::Migration[5.1]
  def change
    remove_column :permissions, :can_manage_all
  end
end
