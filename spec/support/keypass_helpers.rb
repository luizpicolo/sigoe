module KeypassHelpers
  def create_new_keypass(options = {})
    title = options[:title] || Faker::Name.name

    fill_in 'Título', with: title
    fill_in 'Usuário', with: Faker::Internet.user_name
    fill_in 'Senha', with: Faker::Internet.password
    fill_in 'Endereço serviço', with: Faker::Internet.public_ip_v4_address
    select "ifms", :from => "Local"
    fill_in 'Descrição', with: Faker::Lorem.paragraph

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include KeypassHelpers, type: :feature
end
