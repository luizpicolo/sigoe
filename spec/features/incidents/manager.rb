require 'rails_helper'

context "Manager entity Incident" do
  before(:each) do
    @student = FactoryBot.create(:student)
    @course = FactoryBot.create(:course)
    @sector = FactoryBot.create(:sector, initial: 'ASSAL')
    @position = FactoryBot.create(:position, name: 'Assistente de Alunos')
    @user = FactoryBot.create(:user, sector: @sector, position: @position)
    sign_in @user
  end

  feature 'create' do
    scenario 'with valid data' do
      visit new_incident_path
      create_new_incident user: @user.name, student: @student.name, course: @course.name
      expect(page).to have_content("Ocorrência cadastra com sucesso")
    end
  end

  feature 'sign' do
    scenario 'with signed incident' do
      @incident = FactoryBot.create(:incident, signed_in: nil)
      visit incidents_path
      expect(page).to have_link("Assinar", href: "/incidents/#{@incident.id}/sign")
    end

    scenario 'with not signed incident' do
      @incident = FactoryBot.create(:incident)
      visit incidents_path
      expect(page).to have_no_link("Assinar", href: "/incidents/#{@incident.id}/sign")
    end
  end
end
