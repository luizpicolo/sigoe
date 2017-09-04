require 'rails_helper'

RSpec.describe KeypassesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = FactoryGirl.attributes_for(:keypass)
    @model = FactoryGirl.create(:keypass)
    @entity = 'Keypass'
    @path = keypasses_path
  end

  include_examples "permission_controller"
end
