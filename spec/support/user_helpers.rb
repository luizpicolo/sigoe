# frozen_string_literal: true

module UserHelpers
  def sign_in(user, options = {})
    password = options[:password] || user.password

    visit root_path

    fill_in 'Usuário', with: user.username
    fill_in 'Senha', with: password
    click_button 'Entrar'
  end

  def sign_out
    click_link 'Sair'
  end

  def create_new_user(options = {})
    name = options[:name] || Faker::Name.name
    email = options[:email] || Faker::Internet.email
    password = options[:password]

    fill_in 'Nome', with: name
    fill_in 'Email', with: email
    fill_in 'Usuário', with: Faker::Internet.user_name
    fill_in 'Siape', with: Faker::Number.number(digits: 7)
    pwd = Faker::Internet.password
    fill_in 'Senha', with: pwd
    fill_in 'Repetir senha', with: password || pwd

    click_button 'Salvar'
  end

  def add_permission(entity, user, options = {})
    create = options[:create] || false
    read = options[:read] || false
    update = options[:update] || false
    destroy = options[:destroy] || false

    FactoryBot.create(
      :permission,
      entity: entity,
      user: user,
      can_create: create,
      can_read: read,
      can_update: update,
      can_destroy: destroy
    )
  end
end

RSpec.configure do |config|
  config.include UserHelpers, type: :feature
  config.include UserHelpers, type: :model
  config.include UserHelpers, type: :controller
end
