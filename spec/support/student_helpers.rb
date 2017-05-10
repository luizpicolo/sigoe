module StudentHelpers
  def create_new_student(options = {})
    name = options[:name] || Faker::Name.name

    fill_in 'Nome', with: name
    select options[:course], :from => "Turma"
    attach_file('Foto', File.absolute_path('spec/fixtures/logo-ifms.jpg'))

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include StudentHelpers, type: :feature
end
