module UserHelpers
  def sign_in(user, options = {})
    password = options[:password] || user.password

    visit rails_admin_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: password
    click_button 'Entrar'
  end

  def sign_out
    click_link 'Sair'
  end
end

RSpec.configure do |config|
  config.include UserHelpers, :type => :feature
end
