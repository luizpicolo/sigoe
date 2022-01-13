# frozen_string_literal: true

require 'rails_helper'

context 'Manager (crud) entity Course' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @course = FactoryBot.create(:course, polo: @user.polo)
    FactoryBot.create(
      :permission,
      user: @user,
      entity: Course
    )
    sign_in @user
  end

  feature 'create' do
    scenario 'with valid data' do
      visit new_course_path
      # polo = FactoryBot.create(:polo)
      # create_new_course(polo: polo)
      create_new_course
      expect(page).to have_content('Curso cadastro com sucesso')
    end

    scenario 'with existent title' do
      visit new_course_path
      create_new_course name: @course.name
      expect(page).to have_content('Nome já está em uso')
    end
  end

  feature 'update' do
    scenario 'with valid data' do
      visit edit_course_path(@course)
      new_name = Faker::Name.name
      fill_in 'Nome', with: new_name
      click_button 'Salvar'
      expect(page).to have_content('Curso atualizado com sucesso')
      expect(page).to_not have_content(@course.name)
      expect(page).to have_content(new_name)
    end
  end

  feature 'delete' do
    scenario 'with sucess' do
      visit courses_path
      find("a[href='/courses/#{@course.id}']").click
      expect(page).to_not have_content(@course.name)
      expect(page).to have_content('Curso deletado com sucesso')
    end
  end
end
