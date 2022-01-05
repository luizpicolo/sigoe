# frozen_string_literal: true

require 'rails_helper'

context 'Find incident by' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @course = FactoryBot.create(:course, polo: @user.polo)
    @student = FactoryBot.create(:student, course: @course)
    @incident = FactoryBot.create(:incident, student: @student, course: @student.course)
    FactoryBot.create(
      :permission,
      user: @user,
      entity: Incident
    )
    sign_in @user
  end

  feature 'student' do
    scenario 'with attribute name' do
      visit incidents_path
      fill_in 'search', with: @student.name
      click_button 'Buscar'
      expect(page).to have_content(@student.name)
    end

    scenario 'with attribute course' do
      visit incidents_path
      fill_in 'search', with: @student.course_name
      click_button 'Buscar'
      expect(page).to have_content(@student.name)
    end
  end
end
