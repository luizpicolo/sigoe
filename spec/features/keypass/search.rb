require 'rails_helper'

context "Find key by your search scope" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @keypass = FactoryGirl.create(:keypass)
  end

  feature 'search user' do
    scenario "find with attribute title" do
      sign_in @user
      visit keypasses_path
      fill_in 'search', with: @keypass.title
      click_button 'Buscar'
      expect(page).to have_content(@keypass.title)
    end

    scenario "find with fail attribute" do
      sign_in @user
      visit keypasses_path
      fill_in 'search', with: 'wrong_attribute'
      click_button 'Buscar'
      expect(page).to have_content("Sua busca por wrong_attribute não obteve resutados")
    end
  end
end
