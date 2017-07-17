module IncidentHelpers
  def create_new_incident(options = {})
    select options[:student], from: "Estudante"
    select options[:course], from: "Turma"
    select options[:user], from: "Assistente"
    select 'ifms', from: "Instituição"
    fill_in 'Data ocorrência', with: Time.now
    fill_in 'Hora ocorrência', with: Time.now
    fill_in 'Ocorrência', with: Faker::Lorem.characters(4)

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include IncidentHelpers, type: :feature
end
