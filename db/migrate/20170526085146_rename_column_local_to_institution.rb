class RenameColumnLocalToInstitution < ActiveRecord::Migration[5.0]
  def change
    rename_column :incidents, :local, :institution
  end
end
