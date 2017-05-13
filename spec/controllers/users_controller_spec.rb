require 'rails_helper'
require "cancan/matchers"

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
