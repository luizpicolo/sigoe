# frozen_string_literal: true

module CourseHelpers
  def create_new_course(options = {})
    name = options[:name] || Faker::Name.name

    fill_in 'Nome', with: name
    fill_in 'Sigla', with: Faker::Lorem.characters(number: 4)

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include CourseHelpers, type: :feature
end
