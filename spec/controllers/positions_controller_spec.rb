require 'rails_helper'

RSpec.describe PositionsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = FactoryGirl.attributes_for(:position)
    @model = FactoryGirl.create(:position)
    @entity = 'Position'
    @path = positions_path
  end

  include_examples "permission_controller"
end
