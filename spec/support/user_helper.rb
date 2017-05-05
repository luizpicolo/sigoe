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
    fill_in 'Siape', with: Faker::Number.number(7)
    select "SERTI", :from => "Setor"
    pwd = Faker::Internet.password
    fill_in 'Senha', with: pwd
    fill_in 'Repetir senha', with: password || pwd

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include UserHelpers, type: :feature
end
