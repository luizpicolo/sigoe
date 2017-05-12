require 'rails_helper'
require "cancan/matchers"

RSpec.describe UsersController, type: :controller do

  let(:serti) { FactoryGirl.create(:sector, initial: 'serti') }
  let(:audi) { FactoryGirl.create(:sector, initial: 'audi') }
  let(:params_user) { FactoryGirl.build(:user).attributes }
  let(:user) { FactoryGirl.create(:user, sector: serti) }
  let(:other_user) { FactoryGirl.create(:user, sector: audi) }

  describe "GET #index with sector 'serti'" do
    it "should authorized to access this page" do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index with other sector" do
    it "should not authorized to access this page" do
      sign_in other_user
      get :index
      expect(response).to raise_error(CanCan::AccessDenied)
    end
  end

  describe "GET #new with sector 'serti'" do
    it "should authorized to access this page" do
      sign_in user
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create with sector 'serti'" do
    it "should authorized to access this action" do
      sign_in user
      post :create, params: { user: params_user }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit with sector 'serti'" do
    it "should authorized to access this page" do
      sign_in user
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update with sector 'serti'" do
    it "should authorized to access this action" do
      sign_in user
      patch :update, params: { id: user.id, user: { name: 'new_name', password: "" }}
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy with sector 'serti'" do
    it "should authorized to access this action" do
      sign_in user
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(302)
    end
  end
end
