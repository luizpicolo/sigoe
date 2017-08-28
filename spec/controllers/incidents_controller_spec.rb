require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @student = FactoryGirl.create(:student)
    @attr = FactoryGirl.attributes_for(:incident)
                       .merge({student_id: @student.id})
                       .merge({user_id: @user.id})
                       .merge({assistant_id: @user.id })
                       .merge({course_id: @student.course.id})
    @model = FactoryGirl.create(:incident)
    @entity = 'Incident'
    @path = incidents_path
  end

  include_examples "permission_controller"
end
