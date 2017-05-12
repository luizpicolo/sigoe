require 'rails_helper'

context "Find key by your search scope" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @course = FactoryGirl.create(:course)
  end

  feature 'search user' do
    scenario "find with attribute name" do
      sign_in @user
      visit courses_path
      fill_in 'search', with: @course.name
      click_button 'Buscar'
      expect(page).to have_content(@course.name)
    end
  end
end
