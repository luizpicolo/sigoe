# frozen_string_literal: true

class AddFirstSector < SeedMigration::Migration
  def up
    Sector.create(
      name: 'Coinf',
      email: 'coinf@email.com'
    )
  end
end
