# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sector.create([{
  name: 'SERVIÇO DE TECNOLOGIA DA INFORMAÇÃO E SUPORTE TÉCNICO',
  initial: 'SERTI',
  icon: 'ion-monitor'
}])

User.create({
  name: 'admin',
  siape: '12345678',
  sector_id: Sector.first.id,
  username: 'admin',
  email: 'admin@admin.com',
  password: '12345678',
  password_confirmation: '12345678'
})
