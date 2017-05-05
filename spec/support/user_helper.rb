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
end

RSpec.configure do |config|
  config.include UserHelpers, type: :feature
end
