class AddOldIdToTypeIncident < ActiveRecord::Migration[7.0]
  def change
    add_column :type_incidents, :old_id, :integer
  end
end
