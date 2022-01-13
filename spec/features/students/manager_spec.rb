# frozen_string_literal: true

require 'rails_helper'

context 'Manager (crud) entity Students' do
  before(:each) do
    @user = FactoryBot.create(:user)
    @course = FactoryBot.create(:course, polo: @user.polo)
    @student = FactoryBot.create(:student, course: @course)
    FactoryBot.create(
      :permission,
      user: @user,
      entity: Student
    )
    sign_in @user
  end

  feature 'create' do
    scenario 'with valid data' do
      visit new_student_path
      create_new_student
      expect(page).to have_content('Estudante cadastro com sucesso')
    end
  end

  feature 'update' do
    scenario 'with valid data' do
      visit edit_student_path(@student)
      new_name = Faker::Name.name
      fill_in 'Nome', with: new_name
      click_button 'Salvar'
      expect(page).to have_content('Estudante atualizado com sucesso')
      expect(page).to_not have_content(@student.name)
      expect(page).to have_content(new_name)
    end
  end

  feature 'delete' do
    scenario 'with sucess' do
      visit students_path
      find("a[href='/students/#{@student.id}']").click
      expect(page).to_not have_content(@student.name)
      expect(page).to have_content('Estudante deletado com sucesso')
    end
  end
end
