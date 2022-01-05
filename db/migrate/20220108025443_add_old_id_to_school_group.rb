class AddOldIdToSchoolGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :school_groups, :old_id, :integer, index: true
  end
end
