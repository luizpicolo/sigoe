class RenameSchoolGroupToSchoolGroupIdInIncidents < ActiveRecord::Migration[5.1]
  def change
    rename_column :incidents, :school_group, :school_group_id
  end
end
