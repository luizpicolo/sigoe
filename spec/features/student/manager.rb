require 'rails_helper'

context "Manager (crud) entity Students" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @student = FactoryGirl.create(:student)
  end

  feature 'create' do
    scenario 'with valid data' do
      sign_in @user
      visit new_student_path
      create_new_student
      expect(page).to have_content("Estudante cadastro com sucesso")
    end
  end

  feature 'update' do
    scenario 'with valid data' do
      sign_in @user
      visit edit_student_path(@student)
      new_name = Faker::Name.name
      fill_in 'Nome', with: new_name
      click_button 'Salvar'
      expect(page).to have_content("Estudante atualizado com sucesso")
      expect(page).to_not have_content(@student.name)
      expect(page).to have_content(new_name)
    end
  end

  feature 'delete' do
    scenario 'with sucess' do
      sign_in @user
      visit students_path
      find("a[href='/students/#{@student.id}']").click
      expect(page).to_not have_content(@student.name)
      expect(page).to have_content("Estudante deletado com sucesso")
    end
  end
end
