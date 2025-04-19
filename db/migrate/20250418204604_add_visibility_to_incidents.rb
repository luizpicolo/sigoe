class AddVisibilityToIncidents < ActiveRecord::Migration[7.1]
  def change
    add_column :incidents, :visibility, :string, default: 'public', null: false

    reversible do |dir|
      dir.up do
        Incident.reset_column_information
        Incident.update_all(visibility: 'public')
      end
    end
  end
end
