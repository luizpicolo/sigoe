class AddSectorToIncident < ActiveRecord::Migration[7.0]
  def change
    add_reference :incidents, :sector, null: true, foreign_key: true
  end
end
