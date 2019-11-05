# frozen_string_literal: true

require 'rails_helper'

context 'User' do
  feature 'sign in' do
    let!(:user) { FactoryBot.create(:user) }

    scenario 'with valid credentials' do
      sign_in user
      expect(page).to have_content('Login efetuado com sucesso.')
    end

    scenario 'with invalid credentials' do
      sign_in user, password: 'wrongpassword'
      expect(page).to have_content('Inválido Username ou senha.')
    end
  end

  feature 'sign out' do
    let!(:user) { FactoryBot.create(:user) }

    scenario 'always works' do
      sign_in user
      sign_out
      expect(page).to have_content('Para continuar, faça login ou registre-se.')
    end
  end
end
