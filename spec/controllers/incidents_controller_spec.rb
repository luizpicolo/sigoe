require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    @student = FactoryBot.create(:student)
    @attr = FactoryBot.attributes_for(:incident)
                       .merge({student_id: @student.id})
                       .merge({user_id: @user.id})
                       .merge({assistant_id: @user.id })
                       .merge({course_id: @student.course.id})
    @model = FactoryBot.create(:incident)
    @entity = 'Incident'
    @path = incidents_path
  end

  include_examples "permission_controller"
end
