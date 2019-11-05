# frozen_string_literal: true

require 'rails_helper'

context 'Check access permissions' do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  entities = [
    [Student, true], [Student, false],
    [Course, true], [Course, false],
    [SchoolGroup, true], [SchoolGroup, false]
  ]

  entities.each do |(entity, value)|
    feature "manager #{entity}" do
      before(:each) do
        @permissions = FactoryBot.create(
          :permission,
          user: @user,
          entity: entity,
          can_read: value
        )
        sign_in @user
      end

      scenario "link for manager #{value}" do
        visit root_path
        expect(page).to have_content('Administrador') if value == true
        expect(page).not_to have_content('Administrador') if value == false
      end
    end
  end
end
