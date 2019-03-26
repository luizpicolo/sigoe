require 'rails_helper'

context "Manager (crud) entity Keypass" do
  before(:each) do
    @user = FactoryBot.create(:user)
    @keypass = FactoryBot.create(:keypass)
    FactoryBot.create(
      :permission, 
      user: @user,
      entity: Keypass
    )
    sign_in @user
  end

  feature 'create' do
    scenario 'with valid data' do
      visit new_keypass_path
      create_new_keypass
      expect(page).to have_content("Senha cadastra com sucesso")
    end

    scenario 'with existent title' do
      visit new_keypass_path
      create_new_keypass title: @keypass.title
      expect(page).to have_content("Título já está em uso")
    end
  end

  feature 'update' do
    scenario 'with valid data' do
      visit edit_keypass_path(@keypass)
      new_title = Faker::Name.name
      fill_in 'Título', with: new_title
      click_button 'Salvar'
      expect(page).to have_content("Senha atualizada com sucesso")
      expect(page).to_not have_content(@keypass.title)
      expect(page).to have_content(new_title)
    end
  end

  feature 'delete' do
    scenario 'with sucess' do
      visit keypasses_path
      find("a[href='/keypasses/#{@keypass.id}']").click
      expect(page).to_not have_content(@keypass.title)
      expect(page).to have_content("Senha deletada com sucesso")
    end
  end
end
