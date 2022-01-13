class RemoveOldId < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :old_id
    remove_column :school_groups, :old_id
    remove_column :students, :old_id
    remove_column :type_incidents, :old_id
  end
end
