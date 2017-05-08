require 'rails_helper'

context "Manager (crud) entity Keypass" do
  before(:each) do
    @user = FactoryGirl.create(:Keypass)
  end

  feature 'create' do
    scenario 'with valid data' do
      sign_in @user
      visit new_keypass_path
      create_new_user
      expect(page).to have_content("Usuário cadastrado com sucesso")
    end

    scenario 'with existent email' do
      sign_in @user
      visit new_user_path
      create_new_user email: @user.email
      expect(page).to have_content("Email já está em uso")
    end

    scenario 'with password confirmation different of password' do
      sign_in @user
      visit new_user_path
      create_new_user password: 'wrongpassword'
      expect(page).to have_content("Confirme sua senha não é igual a Senha")
    end
  end

  feature 'update' do
    scenario 'with valid data' do
      sign_in @user
      visit edit_user_path(@user)
      new_name = Faker::Name.name
      fill_in 'Nome', with: new_name
      click_button 'Salvar'
      expect(page).to have_content("Usuário atualizado com sucesso")
      expect(page).to_not have_content(@user.name)
      expect(page).to have_content(new_name)
    end
  end

  feature 'delete' do
    scenario 'with user not current' do
      sign_in @user
      new_user = FactoryGirl.create(
        :user,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        username: Faker::Internet.user_name,
        sector: @user.sector)
      visit users_path
      find("a[href='/users/#{new_user.id}']").click
      expect(page).to_not have_content(new_user.name)
      expect(page).to have_content("Usuário deletado com sucesso")
    end
  end
end
