require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = FactoryGirl.attributes_for(:course)
    @model = FactoryGirl.create(:course)
    @entity = 'Course'
    @path = courses_path
  end

  include_examples "permission_controller"
end
