# frozen_string_literal: true

require 'rails_helper'

context 'When keeping Incident' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @course = FactoryBot.create(:course, polo: @user.polo)
    @student = FactoryBot.create(:student, course: @course)
    @type_incident = FactoryBot.create(:type_incident, name: 'Atraso')
    FactoryBot.create(
      :permission,
      user: @user,
      entity: Incident
    )
    sign_in @user
  end

  feature 'i should create an entry' do
    scenario 'with valid data' do
      visit new_incident_path
      create_new_incident user: @user.name, student: @student.name,
                          type_incident: @type_incident.name
      expect(page).to have_content('Ocorrência cadastra com sucesso')
    end
  end

  feature 'i should' do
    scenario 'see a button to sign a unsigned incident' do
      @incident = FactoryBot.create(:incident, course: @course, student: @student, signed_in: nil)
      visit incidents_path
      expect(page).to have_link('Assinar', href: "/incidents/#{@incident.id}/sign")
    end

    scenario 'not see a button with not signed incident' do
      @incident = FactoryBot.create(:incident)
      visit incidents_path
      expect(page).to have_no_link('Assinar', href: "/incidents/#{@incident.id}/sign")
    end
  end
end
