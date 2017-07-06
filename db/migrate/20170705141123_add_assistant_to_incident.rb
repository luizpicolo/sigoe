class AddAssistantToIncident < ActiveRecord::Migration[5.1]
  def change
    add_column :incidents, :assistant_id, :integer, index: true
  end
end
