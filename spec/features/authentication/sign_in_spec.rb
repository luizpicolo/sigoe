require 'rails_helper'

feature 'Sign in' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'with valid credentials' do
    sign_in user
    expect(page).to have_content('Login efetuado com sucesso.')
  end

  scenario 'with invalid credentials' do
    sign_in user, password: 'wrongpassword'
    expect(page).to have_content('Email ou senha inválidos.')
  end
end
