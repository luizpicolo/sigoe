require 'rails_helper'

context "User" do
  feature 'create' do
    let(:user) { FactoryGirl.create(:user) }

    scenario 'with valid data' do
      sign_in user
      visit new_user_path

      fill_in 'Nome', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Usuário', with: Faker::Internet.user_name
      fill_in 'Siape', with: Faker::Number.number(7)
      select "SERTI", :from => "Setor"
      pwd = Faker::Internet.password
      fill_in 'Senha', with: pwd
      fill_in 'Repetir senha', with: pwd

      click_button 'Salvar'

      expect(page).to have_content("Usuário cadastrado com sucesso")
    end
  end
end
