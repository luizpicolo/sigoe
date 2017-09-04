require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @attr = FactoryGirl.attributes_for(:student).merge({course_id: FactoryGirl.create(:course).id})
    @model = FactoryGirl.create(:student)
    @entity = 'Student'
    @path = students_path
  end

  include_examples "permission_controller"
end
