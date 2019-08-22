# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SectorsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #actions' do
    %w[audi diren prof serti].each do |view|
      it "render template #{view} with success" do
        get :actions, params: { sector_id: view }
        expect(response).to render_template(view)
      end
    end
  end
end
