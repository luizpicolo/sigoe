class AddNewTypeIncidentExit < SeedMigration::Migration
  def up
    Incident::TypeIncident.create!([
      { name: 'Saida' }
    ])
  end
end
