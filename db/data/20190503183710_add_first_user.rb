# frozen_string_literal: true

class AddFirstUser < SeedMigration::Migration
  def up
    Sector.create(
      name: 'Diretoria de Ensino',
      initial: 'DIREN',
      icon: 'ion-university'
    )

    User.create(
      name: 'admin',
      siape: '12345678',
      sector_id: Sector.first.id,
      username: 'admin',
      email: 'admin@admin.com',
      password: '12345678',
      password_confirmation: '12345678',
      admin: true
    )
  end
end
