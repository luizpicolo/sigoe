class AddSchoolGroupToIncident < ActiveRecord::Migration[5.1]
  def change
    add_column :incidents, :school_group, :integer
  end
end
