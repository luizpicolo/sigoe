# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:incident_attributes) { FactoryBot.attributes_for(:incident, visibility: 'public') }

  before { sign_in user }

  describe 'POST #create' do
    it 'cria um incidente com visibilidade pública' do
      expect {
        post :create, params: { incident: incident_attributes }
      }.to change(Incident, :count).by(1)

      expect(Incident.last.visibility).to eq('public')
    end
  end
end
