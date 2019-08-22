# frozen_string_literal: true

class AddNewTypeIncident < SeedMigration::Migration
  def up
    Incident::TypeIncident.create!([
                                     { name: 'Atraso' }
                                   ])
  end
end
