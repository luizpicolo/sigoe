# frozen_string_literal: true

class AddFirstInstitution < SeedMigration::Migration
  def up
    Institution.create(
      name: 'Ifms',
    )
  end
end
