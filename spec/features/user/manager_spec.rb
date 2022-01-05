# frozen_string_literal: true

require 'rails_helper'

context 'Manager (crud) entity User' do
  before(:each) do
    @user = FactoryBot.create(:user)
    FactoryBot.create(
      :permission,
      user: @user,
      entity: User
    )
    sign_in @user
  end

  feature 'create' do
    scenario 'with valid data' do
      visit new_user_path
      create_new_user
      expect(page).to have_content('Usuário cadastrado com sucesso')
    end

    scenario 'with existent email' do
      visit new_user_path
      create_new_user email: @user.email
      expect(page).to have_content('E-mail já está em uso')
    end

    scenario 'with password confirmation different of password' do
      visit new_user_path
      create_new_user password: 'wrongpassword'
      expect(page).to have_content('Confirme sua senha não é igual a Senha')
    end
  end

  feature 'update' do
    scenario 'with valid data' do
      visit edit_user_path(@user)
      new_name = Faker::Name.name
      fill_in 'Nome', with: new_name
      click_button 'Salvar'
      expect(page).to have_content('Usuário atualizado com sucesso')
      expect(page).to_not have_content(@user.name)
      expect(page).to have_content(new_name)
    end
  end

  feature 'delete' do
    scenario 'with user not current' do
      new_user = FactoryBot.create(
        :user,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        username: Faker::Internet.user_name,
        polo: @user.polo
      )
      visit users_path
      find("a[href='/users/#{new_user.id}']").click
      expect(page).to_not have_content(new_user.name)
      expect(page).to have_content('Usuário deletado com sucesso')
    end
  end
end
