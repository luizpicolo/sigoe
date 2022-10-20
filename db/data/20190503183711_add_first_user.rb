# frozen_string_literal: true

class AddFirstUser < SeedMigration::Migration
  def up
    User.create(
      name: 'admin',
      siape: '12345678',
      username: 'admin',
      email: 'admin@admin.com',
      password: '12345678',
      password_confirmation: '12345678',
      admin: true,
      polo: Polo.first
    )
  end
end
