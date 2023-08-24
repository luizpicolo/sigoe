class AddStatusToIncidentProhibitionAndResponsibility < ActiveRecord::Migration[7.0]
  def change
    add_column :prohibition_and_responsibilities, :status, :boolean, default: false
    add_column :student_duties, :status, :boolean, default: false
  end
end
