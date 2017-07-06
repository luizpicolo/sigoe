# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sector.create([
  {
    name: 'Serviço de Tecnilogia da informação e Suporte',
    initial: 'SERTI',
    icon: 'ion-monitor'
  },
  {
    name: 'Diretoria de Ensino',
    initial: 'DIREN',
    icon: 'ion-university'
  },
  {
    name: 'Áudio Visual',
    initial: 'AUDI',
    icon: 'ion-headphone'
  },
  {
    name: 'Professores',
    initial: 'PROF',
    icon: 'fa fa-leanpub icon'
  }
])

Position.create([
  { name: 'Técnico em Tecnologia da Informação' }
])

User.create({
  name: 'admin',
  siape: '12345678',
  sector_id: Sector.first.id,
  position_id: Position.first.id,
  username: 'admin',
  email: 'admin@admin.com',
  password: '12345678',
  password_confirmation: '12345678'
})
