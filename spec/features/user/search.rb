require 'rails_helper'

context "Find users by your search scope" do
  before(:each) do
    @sector = FactoryGirl.create(:sector)
    @users = FactoryGirl.create_list(:user, 2, sector: @sector)
  end

  feature 'search user' do
    ['name', 'email', 'siape', 'sector'].each do |attr|
      scenario "find with attribute #{attr}" do
        sign_in @users.first
        visit users_path
        fill_in 'search', with: @users.first.read_attribute(attr)
        click_button 'Buscar'
        expect(page).to have_content(@users.first.name)
      end
    end
  end
end
