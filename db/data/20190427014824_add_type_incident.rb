# frozen_string_literal: true

class AddTypeIncident < SeedMigration::Migration
  def up
    Incident::TypeIncident.create!([
                                     { name: 'Disciplinar' },
                                     { name: 'Tranferência' },
                                     { name: 'Ambulatorial' },
                                     { name: 'Psicologico' },
                                     { name: 'Atendimento ao responsável' },
                                     { name: 'Orientação Pedagógica' }
                                   ])
  end
end
