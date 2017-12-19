require 'rails_helper'

context "Find key by your search scope" do
  before(:each) do
    @user = FactoryBot.create(:user)
    @student = FactoryBot.create(:student)
    sign_in @user
  end

  feature 'search student' do
    scenario "find with attribute name" do
      visit students_path
      fill_in 'search', with: @student.title
      click_button 'Buscar'
      expect(page).to have_content(@student.name)
    end

    scenario "find with attribute course" do
      visit students_path
      fill_in 'search', with: @student.course_name
      click_button 'Buscar'
      expect(page).to have_content(@student.name)
    end
  end
end
