# frozen_string_literal: true

module StudentHelpers
  def create_new_student(options = {})
    name = options[:name] || Faker::Name.name

    fill_in 'Nome', with: name
    fill_in 'Responsável', with: name
    # fill_in 'R.A', with: '12345678'
    fill_in 'Senha para assinatura digital', with: '123456789'
    fill_in 'Confirmar senha', with: '123456789'
    fill_in 'student_responsible', with: name
    fill_in 'student_responsible_contact', with: 'email@ifms.edu.br'
    # select options[:course], from: 'Curso'
    # select options[:school_group], from: 'Turma'
    # attach_file('Imagem', File.absolute_path('spec/fixtures/logo-ifms.jpg'))

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include StudentHelpers, type: :feature
end
