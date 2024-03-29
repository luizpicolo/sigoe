# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    @sector = FactoryBot.create(:sector)
    @student = FactoryBot.create(:student)
    @type_incident = FactoryBot.create(:type_incident)
    @attr = FactoryBot.attributes_for(:incident)
        .merge(student_id: @student.id)
        .merge(user_id: @user.id)
        .merge(sector_id: @sector.id)
        .merge(type_incident_id: @type_incident.id)
        .merge(assistant_id: @user.id)
    @model = FactoryBot.create(:incident)
    @entity = 'Incident'
    @path = incidents_path
  end

  include_examples 'permission_controller'
end
