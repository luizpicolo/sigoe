module IncidentHelpers
  def create_new_incident(options = {})
    select options[:student], from: "Estudante"
    select options[:course], from: "Curso"
    select options[:user], from: "Assistente"
    select 'Residente', from: "Estudente é?"
    select 'Ifms', from: "Instituição"
    select 'Não', from: "Ocorrências resolvida?"
    fill_in 'Data ocorrência', with: Time.zone.now
    fill_in 'Hora ocorrência', with: Time.zone.now
    fill_in 'Ocorrência', with: Faker::Lorem.characters(4)

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include IncidentHelpers, type: :feature
end
