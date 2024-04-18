class AddCanExportToAcademicSystem < ActiveRecord::Migration[7.1]
  def change
    add_column :permissions, :can_export_to_academic_system, :boolean, default: false
  end
end
