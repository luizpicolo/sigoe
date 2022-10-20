# frozen_string_literal: true

class AddFirstPolo < SeedMigration::Migration
  def up
    Polo.create(
      name: 'NA',
      institution_id: Institution.first
      inicial: 'NA'
    )
  end
end
